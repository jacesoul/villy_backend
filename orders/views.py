import json
import bcrypt
import jwt
import uuid
from datetime import datetime

from django.http            import JsonResponse
from django.views           import View
from django.db.models       import Q
from django.db              import transaction
from django.core.exceptions import ObjectDoesNotExist


from core.models       import TimeStampModel
from core.views        import check_login
from my_settings       import SECRET_KEY, ALGORITHM
from users.models      import User, PointHistory, Point
from products.models   import Product, ProductEfficacy, ProductSummary, Efficacy
from carts.models      import Cart
from orders.models     import OrderStatus, OrderListStatus, Shipment, Order, OrderItem

class OrderView(View):

    @check_login
    @transaction.atomic
    def post(self, request):
        try: 
            data         = json.loads(request.body)
            user         = request.user
            point        = user.point_set.get(user=user).point

            all_product_list = data['products']
            id_quantity  = {value["productID"]:value["quantity"] for (key,value) in all_product_list.items()}
            total_price  = 0
            
            for product_id, quantity in id_quantity.items():
                product_price  = Product.objects.get(id=product_id).price
                total_price   += int(quantity)*int(product_price)

            if int(point) >= int(total_price):
                updated_point = int(point) - int(total_price)
                user.point_set.filter(user=user).update(point= updated_point) 
                
                new_uuid = uuid.uuid4()
                Order.objects.create(
                    user_id         = user.id,
                    order_status_id = OrderStatus.objects.get(id=1).id,
                    order_number    = new_uuid
                    )          
                
                order = Order.objects.get(order_number=new_uuid)

                PointHistory.objects.create(
                    order = order,
                    point = int(total_price)
                )
                
                for product_id, quantity in id_quantity.items():
                    OrderItem.objects.create(
                        order_id             = order.id,
                        product_id           = Product.objects.get(id=product_id).id,
                        quantity             = quantity,
                        shipment_id          = Shipment.objects.get(id=1).id,
                        order_list_status_id = OrderListStatus.objects.get(id=1).id
                    )
                    Cart.objects.filter(user_id=user.id, product_id=product_id).delete()

                return JsonResponse({'message' : 'SUCCESS'}, status=200)
            return JsonResponse({'message' : 'NOT_ENOUGH_POINTS'}, status=401)
        except KeyError:
            return JsonResponse({'message' : 'KEY_ERROR'}, status=400)
        except ValueError:
            return JsonResponse({'message' : 'VALUE_ERROR'}, status=400)


    @check_login
    def get(self, request):
        try: 
            user = request.user
            orders = Order.objects.filter(user=user) 
            results = [{
                "orderID"    : order.id,
                "orderStatus": order.order_status.status,
                "orderNumber": order.order_number,
                "orderItem"  : [{
                    "productID"          : order_item.product.id,
                    "productName"        : order_item.product.name,
                    "quantity"           : order_item.quantity,
                    "thumbnail_image_url": order_item.product.thumbnail_image_url,
                    "productPrice"       : order_item.product.price,
                    "shipmentName"       : order_item.shipment.company,
                    "shipmentNumber"     : order_item.shipment.tracking_number,
                    "orderItemStatus"    : order_item.order_list_status.status,
                    } for order_item in OrderItem.objects.filter(order=order)]
            }for order in orders]

            point = int(Point.objects.get(user=user).point)
            return JsonResponse({"product":results,"point":point},status=200)

        except ObjectDoesNotExist:
            return JsonResponse({'message' : 'MODEL_ERROR'}, status=400)
        except TypeError:
            return JsonResponse({"message":"TYPE_ERROR"},status=400)
        except ValueError:
            return JsonResponse({"message":"VALUE_ERROR"},status=400)