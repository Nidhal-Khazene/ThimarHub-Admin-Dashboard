import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'remove_product_state.dart';

class RemoveProductCubit extends Cubit<RemoveProductState> {
  RemoveProductCubit() : super(RemoveProductInitial());
}
