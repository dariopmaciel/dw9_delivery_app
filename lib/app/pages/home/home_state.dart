// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:dark_week/app/dto/order_product_dto.dart';
import 'package:dark_week/app/models/product_model.dart';

part 'home_state.g.dart';//"TERMINAL: flutter pub run build_runner build"

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<OrderProductDto> shoppingBag;

  const HomeState(
    this.status,
    this.products,
    this.errorMessage,
    this.shoppingBag,
  );

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        shoppingBag = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, products, errorMessage, shoppingBag];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
    List<OrderProductDto>? shoppingBag,
  }) {
    return HomeState(
      status ?? this.status,
      products ?? this.products,
      errorMessage ?? this.errorMessage,
      shoppingBag ?? this.shoppingBag,
    );
  }
}
