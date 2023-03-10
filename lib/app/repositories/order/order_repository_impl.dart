import 'dart:developer';

import 'package:dark_week/app/core/exceptions/repository_exception.dart';
import 'package:dark_week/app/core/rest_client/custom_dio.dart';
import 'package:dark_week/app/models/payment_type_model.dart';
import 'package:dark_week/app/repositories/order/order_repository.dart';
import 'package:dio/dio.dart';

class OrderRepositoryImpl implements OrderRepository {
  final CustomDio dio;

  OrderRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<PaymentTypeModel>> getAllPaymentsTypes() async {
    try {
      final result = await dio.auth().get('/payment-types');
      return result.data
          .map<PaymentTypeModel>((p) => PaymentTypeModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar formas de pagamento', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar formas de pagamento');
    }
  }
}
