import 'package:dark_week/app/dto/order_product_dto.dart';
import 'package:dark_week/app/pages/order/order_state.dart';
import 'package:dark_week/app/repositories/order/order_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderController extends Cubit<OrderState> {
  final OrderRepository _orderRepository;

  OrderController(this._orderRepository) : super(const OrderState.initial());

  void load(List<OrderProductDto> products) {
    emit(state.copyWith(status: OrderStatus.loading));
    emit(state.copyWith(orderProducts: products, status: OrderStatus.loaded));
  }
}
