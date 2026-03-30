import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delete_orders_state.dart';

class DeleteOrdersCubit extends Cubit<DeleteOrdersState> {
  DeleteOrdersCubit() : super(DeleteOrdersInitial());
}
