// ignore_for_file: public_member_api_docs, sort_constructors_first
//part 'home_state.g.dart';//"TERMINAL: flutter pub run build_runner build"

import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:dark_week/app/dto/order_product_dto.dart';

part 'order_state.g.dart';

@match
enum OrderStatus {
  initial,
  loaded,
  loading,
  error,
}

class OrderState extends Equatable {
  final OrderStatus status;
  final List<OrderProductDto> orderProducts;

  OrderState({
    required this.status,
    required this.orderProducts,
  });

  OrderState.initial()
      : status = OrderStatus.initial,
        orderProducts = const [];

  @override
  List<Object?> get props => [status, orderProducts];

  OrderState copyWith({
    OrderStatus? status,
    List<OrderProductDto>? orderProducts,
  }) {
    return OrderState(
      status: status ?? this.status,
      orderProducts: orderProducts ?? this.orderProducts,
    );
  }
}
