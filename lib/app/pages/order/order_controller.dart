import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dark_week/app/dto/order_product_dto.dart';
import 'package:dark_week/app/pages/order/order_state.dart';
import 'package:dark_week/app/repositories/order/order_repository.dart';

class OrderController extends Cubit<OrderState> {
  final OrderRepository _orderRepository;

  OrderController(this._orderRepository) : super(const OrderState.initial());

  Future<void> load(List<OrderProductDto> products) async {
    try {
      emit(state.copyWith(status: OrderStatus.loading));
      //ao acrescentar esta linha o prog não carrega corretamente
      //final paymentTypes = await _orderRepository.getAllPaymentsTypes();
      emit(
        state.copyWith(
          orderProducts: products,
          status: OrderStatus.loaded,
          //  ao acrescentar esta linha o prog não carrega corretamente
          //  paymentTypes: paymentTypes,
        ),
      );
    } catch (e, s) {
      log("Erro ao carregar PAGINA", error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: OrderStatus.error,
          errorMessage: "Erro ao carregar página",
        ),
      );
    }
  }
}
