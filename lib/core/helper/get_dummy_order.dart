import '../../features/orders/data/models/order_model.dart';
import '../../features/orders/data/models/payment_card_model.dart';
import '../../features/orders/data/models/product_order_model.dart';
import '../../features/orders/data/models/shipping_address_model.dart';

OrderModel getDummyOrder() {
  final shippingAddress = ShippingAddressModel(
    id: 1,
    fullName: "John Doe",
    email: "john.doe@email.com",
    address: "123 Main Street",
    city: "New York",
    apartmentNumber: 12,
  );

  final products = [
    OrderProductsModel(
      productCode: "PRD-001",
      productName: "Nike Air Max",
      productPrice: 120.0,
      imageUrl: "https://dummyimage.com/600x400/000/fff",
      quantity: 1,
    ),
    OrderProductsModel(
      productCode: "PRD-002",
      productName: "Adidas Hoodie",
      productPrice: 80.0,
      imageUrl: "https://dummyimage.com/600x400/000/fff",
      quantity: 2,
    ),
  ];

  final paymentCard = PaymentCardModel(
    name: "John Doe",
    cardNumber: "4242424242424242",
    expirationCard: "12/28",
    cvv: "123",
  );

  final total = products.fold<double>(
    0.0,
    (sum, item) => sum + (item.productPrice * item.quantity),
  );

  return OrderModel(
    uID: "USER-12345",
    totalPrice: total,
    shippingAddressModel: shippingAddress,
    orderProducts: products,
    paymentCardModel: paymentCard,
    paymentMethod: "Credit Card",
    status: "pending",
    date: DateTime.now().toString(),
  );
}
