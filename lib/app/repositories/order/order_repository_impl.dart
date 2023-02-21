import 'dart:developer';

import 'package:dark_week/app/core/exceptions/repository_exception.dart';
import 'package:dark_week/app/core/rest_client/custom_dio.dart';
import 'package:dark_week/app/models/payment_types_model.dart';
import 'package:dio/dio.dart';

import './order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final CustomDio dio;

  OrderRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<PaymentTypesModel>> getAllPaymentsTypes() async {
    try {
      final result = await dio.auth().get("/payment-types");
      return result.data
          .map<PaymentTypesModel>((p) => PaymentTypesModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log("Erro ao buscar formas de pagamento", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar formas de pagamento");
    }
  }
}
