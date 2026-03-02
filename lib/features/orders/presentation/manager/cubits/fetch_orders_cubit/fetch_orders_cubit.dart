import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/order_entity.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit({required this.ordersRepo}) : super(FetchOrdersInitial());
  final OrdersRepo ordersRepo;

  Future<void> fetchOrders() async {
    emit(FetchOrdersLoading());
    final result = await ordersRepo.fetchOrders();
    result.fold(
      (failure) => emit(FetchOrdersFailure(errorMessage: failure.message)),
      (orders) => emit(FetchOrdersSuccess(orders: orders)),
    );
  }
}
