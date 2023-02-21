// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:dark_week/app/dto/order_product_dto.dart';

part 'order_state.g.dart';

@match
enum OrderStatus {
  initial,
  loaded,
}

class OrderState extends Equatable {
  final OrderStatus status;
  final List<OrderProductDto> orderProducts;

  const OrderState(this.status, this.orderProducts);

  const OrderState.initial()
      : status = OrderStatus.initial,
        orderProducts = const [];

  @override
  List<Object?> get props => [status, orderProducts];

  OrderState copyWith({
    OrderStatus? status,
    List<OrderProductDto>? orderProducts,
  }) {
    return OrderState(
      status ?? this.status,
      orderProducts ?? this.orderProducts,
    );
  }
}
