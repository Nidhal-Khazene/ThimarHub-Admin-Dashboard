import 'package:ecommerce_app_dashboard/features/orders/data/models/payment_card_model.dart';
import 'package:ecommerce_app_dashboard/features/orders/data/models/product_order_model.dart';
import 'package:ecommerce_app_dashboard/features/orders/data/models/shipping_address_model.dart';

class OrderModel {
  final double totalPrice;
  final String uID;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductsModel> orderProducts;
  final PaymentCardModel paymentCardModel;
  final String paymentMethod;
  final String? status;
  final String? date;

  OrderModel({
    this.status,
    this.date,
    required this.paymentCardModel,
    required this.orderProducts,
    required this.paymentMethod,
    required this.totalPrice,
    required this.uID,
    required this.shippingAddressModel,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json["totalPrice"],
      uID: json["uID"],
      shippingAddressModel: ShippingAddressModel.fromJson(
        json["shippingAddressModel"],
      ),
      orderProducts: json["orderProducts"],
      paymentCardModel: PaymentCardModel.fromJson(json["paymentCardModel"]),
      paymentMethod: json["paymentMethod"],
      status: json["status"],
      date: json["date"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "totalPrice": totalPrice,
      "uID": uID,
      "status": "pending",
      "date": DateTime.now().toString(),
      "shippingAddressModel": shippingAddressModel.toJson(),
      "orderProducts": orderProducts.map((e) => e.toJson()).toList(),
      "paymentCardModel": paymentCardModel.toJson(),
      "paymentMethod": paymentMethod,
    };
  }
}
