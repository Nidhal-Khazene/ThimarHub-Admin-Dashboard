import 'package:ecommerce_app_dashboard/core/enums/order_status_enum.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/payment_card_entity.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/product_order_entity.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

import '../utils/assets.dart';

OrderEntity getDummyOrder() {
  final shippingAddress = ShippingAddressEntity(
    id: 1,
    fullName: "John Doe",
    email: "john.doe@email.com",
    address: "123 Main Street",
    city: "New York",
    apartmentNumber: 12,
  );

  final products = [
    OrderProductsEntity(
      productCode: "PRD-001",
      productName: "اناناس",
      productPrice: 120.0,
      imageUrl: Assets.imagesProductsAnanas,
      quantity: 1,
    ),
    OrderProductsEntity(
      productCode: "PRD-002",
      productName: "افوكادو",
      productPrice: 80.0,
      imageUrl: Assets.imagesProductsAvocado,
      quantity: 2,
    ),
  ];

  final paymentCard = PaymentCardEntity(
    name: "John Doe",
    cardNumber: "4242424242424242",
    expirationCard: "12/28",
    cvv: "123",
  );

  final total = products.fold<double>(
    0.0,
    (sum, item) => sum + (item.productPrice * item.quantity),
  );

  return OrderEntity(
    orderID: "Order-12345-dummy",
    uID: "USER-12345",
    totalPrice: total,
    shippingAddressEntity: shippingAddress,
    orderProducts: products,
    paymentCardEntity: paymentCard,
    paymentMethod: "Credit Card",
    status: OrderStatusEnum.pending,
    date: DateTime.now().toString(),
  );
}
