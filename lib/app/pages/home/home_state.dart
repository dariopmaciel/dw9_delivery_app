// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:dark_week/app/models/product_model.dart';
import 'package:match/match.dart';
//part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;

  const HomeState(this.status, this.products);

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [];

  @override
  List<Object?> get props => [status, products];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
  }) {
    return HomeState(
      status ?? this.status,
      products ?? this.products,
    );
  }
}
