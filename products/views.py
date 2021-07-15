import json

from django.http      import JsonResponse
from django.views     import View
from django.db.models import Q

from core.views        import check_login, check_login_or_not

from datetime       import datetime
from .models        import Product, Efficacy, ProductEfficacy, ProductSummary
from carts.models   import Cart


class ProductsView(View):
    @check_login_or_not
    def get(self, request):
        try:
            if request.user: 
                user = request.user       
                efficacy = request.GET.getlist('efficacy',None)
                q_object = Q()
                if efficacy:
                    q_object &= Q(efficacy__id__in = efficacy)
                
                products = Product.objects.filter(q_object).distinct()

                results = [{
                                "productID"          : product.id,
                                "productName"        : product.name,
                                "productPrice"       : int(product.price),
                                "productTablet"      : product.tablet,
                                "thumbnail_image_url": product.thumbnail_image_url,
                                "icon_image_url"     : [product_icon.icon_url for product_icon in product.efficacy.all()],
                                "summary"            : [text.summary for text in product.productsummary_set.all()],
                                "cart_exist"         : Cart.objects.filter(product_id=product.id, user=user).exists(),
                                }for product in products]
                return JsonResponse({"message":results},status=200)
            else: 
                efficacy = request.GET.getlist('efficacy',None)
                q_object = Q()
                if efficacy:
                    q_object &= Q(efficacy__id__in = efficacy)
                
                products = Product.objects.filter(q_object).distinct()

                results = [{
                                "productID"          : product.id,
                                "productName"        : product.name,
                                "productPrice"       : int(product.price),
                                "productTablet"      : product.tablet,
                                "thumbnail_image_url": product.thumbnail_image_url,
                                "icon_image_url"     : [product_icon.icon_url for product_icon in product.efficacy.all()],
                                "summary"            : [text.summary for text in product.productsummary_set.all()],
                                }for product in products]
                return JsonResponse({"message":results},status=200)

        except TypeError:
            return JsonResponse({"message":"TYPE_ERROR"},status=400)
        except ValueError:
            return JsonResponse({"message":"VALUE_ERROR"},status=400)


class ProductsDetailsView(View): 
    @check_login_or_not
    def get(self, request, product_id):
        try:
            if request.user:
                user = request.user
                product = Product.objects.get(id=product_id)
                cart_exist = Cart.objects.filter(product_id=product.id, user=user)
                
                results = [{
                        "productID"          : product.id,
                        "productName"        : product.name,
                        "productPrice"       : product.price,
                        "productTablet"      : product.tablet,
                        "thumbnail_image_url": product.thumbnail_image_url,
                        "productDescription" : product.description,
                        "icon_image_url"     : [product_icon.icon_url for product_icon in product.efficacy.all()],
                        "icon_name"          : [product_icon.summary for product_icon in product.productsummary_set.all()],
                        "cart_exist"         : cart_exist.exists(),
                    }
                ]
                return JsonResponse({"message":results},status=200)

            else: 
                product = Product.objects.get(id=product_id)
                
                results = [{
                        "productID"          : product.id,
                        "productName"        : product.name,
                        "productPrice"       : product.price,
                        "productTablet"      : product.tablet,
                        "thumbnail_image_url": product.thumbnail_image_url,
                        "productDescription" : product.description,
                        "icon_image_url"     : [product_icon.icon_url for product_icon in product.efficacy.all()],
                        "icon_name"          : [product_icon.summary for product_icon in product.productsummary_set.all()],
                    }
                ]
                return JsonResponse({"message":results},status=200)
        except TypeError:
            return JsonResponse({"message":"TYPE_ERROR"},status=400)
        except ValueError:
            return JsonResponse({"message":"VALUE_ERROR"},status=400)