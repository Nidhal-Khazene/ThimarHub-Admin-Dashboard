import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_dashboard/core/enums/order_status_enum.dart';
import 'package:ecommerce_app_dashboard/core/errors/failures.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders();
  Future<Either<Failure, void>> updateOrder({
    required OrderStatusEnum status,
    required String orderID,
  });
}
