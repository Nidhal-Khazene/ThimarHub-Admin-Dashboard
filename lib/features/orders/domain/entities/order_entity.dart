import 'package:ecommerce_app_dashboard/features/orders/domain/entities/payment_card_entity.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/product_order_entity.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uID;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductsEntity> orderProducts;
  final PaymentCardEntity paymentCardEntity;
  final String paymentMethod;
  final String? status;
  final String? date;

  OrderEntity({
    required this.shippingAddressEntity,
    required this.paymentCardEntity,
    this.status,
    this.date,
    required this.orderProducts,
    required this.paymentMethod,
    required this.totalPrice,
    required this.uID,
  });
}
