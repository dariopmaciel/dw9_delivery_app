import 'package:bloc/bloc.dart';
import 'package:dark_week/app/dto/order_product_dto.dart';
import 'package:dark_week/app/pages/order/order_state.dart';
import 'package:dark_week/app/pages/order/widget/payment_types_field.dart';
import 'package:dark_week/app/repositories/order/order_repository.dart';

class OrderController extends Cubit<OrderState> {
  final OrderRepository _orderRepository;

  OrderController(this._orderRepository) : super(OrderState.initial());

  void load(List<OrderProductDto> products) async {
    emit(state.copyWith(status: OrderStatus.loading));
    final PaymentTypes = await _orderRepository.getAllPaymentsTypes();
    emit(state.copyWith(orderProducts: products, status: OrderStatus.loaded));
  }
}
