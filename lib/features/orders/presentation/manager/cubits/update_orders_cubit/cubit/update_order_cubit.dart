import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_dashboard/core/enums/order_status_enum.dart';
import 'package:ecommerce_app_dashboard/features/orders/data/repos/orders_repo_impl.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.ordersRepo) : super(UpdateOrderInitial());
  final OrdersRepo ordersRepo;
  Future<void> updateOrder({
    required OrderStatusEnum status,
    required String orderID,
  }) async {
    emit(UpdateOrderLoading());
    final result = await ordersRepo.updateOrder(
      status: status,
      orderID: orderID,
    );
    result.fold(
      (failure) => emit(UpdateOrderFailure(errMessage: failure.message)),
      (_) => emit(UpdateOrderSuccess()),
    );
  }
}
