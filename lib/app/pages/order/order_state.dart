// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:dark_week/app/dto/order_product_dto.dart';
import 'package:dark_week/app/models/payment_type_model.dart';

part 'order_state.g.dart'; //28:00 //"TERMINAL: flutter pub run build_runner build"

///avaliar video 5 - 34:27

@match
enum OrderStatus {
  initial,
  loading,
  loaded,
  error,
}

class OrderState extends Equatable {
  final OrderStatus status;
  final List<OrderProductDto> orderProducts;
  final List<PaymentTypeModel> paymentTypes;
  final String? errorMessage;

  const OrderState({
    required this.status,
    required this.orderProducts,
    required this.paymentTypes,
    this.errorMessage,
  });

  const OrderState.initial()
      : status = OrderStatus.initial,
        orderProducts = const [],
        paymentTypes = const [],
        errorMessage = null;

  @override
  List<Object?> get props =>
      [status, orderProducts, paymentTypes, errorMessage];

  OrderState copyWith({
    OrderStatus? status,
    List<OrderProductDto>? orderProducts,
    List<PaymentTypeModel>? paymentTypes,
    String? errorMessage,
  }) {
    return OrderState(
      status: status ?? this.status,
      orderProducts: orderProducts ?? this.orderProducts,
      paymentTypes: paymentTypes ?? this.paymentTypes,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
