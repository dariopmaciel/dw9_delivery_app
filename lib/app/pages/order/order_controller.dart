import 'package:bloc/bloc.dart';
import 'package:dark_week/app/dto/order_product_dto.dart';
import 'package:dark_week/app/pages/order/order_state.dart';

class OrderController extends Cubit<OrderState> {
  OrderController() : super(OrderState.initial());

  void load(List<OrderProductDto> products) {
    emit(state.copyWith(orderProducts: products));
  }
}
