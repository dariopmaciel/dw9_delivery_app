// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:dark_week/app/core/exceptions/repository_exception.dart';
import 'package:dark_week/app/core/rest_client/custom_dio.dart';
import 'package:dark_week/app/models/product_model.dart';
import 'package:dark_week/app/repositories/products/products_repository.dart';
import 'package:dio/dio.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final CustomDio dio;
  ProductsRepositoryImpl({
    required this.dio,
  });

//busca de produtos
  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unauth().get("/products");
      // se não colocar <ProductModel> irá falar que list de dynamic não é lista de Productmodel pois não faz o cast automaticamente
      //retorno de produtos buscados
      return result.data
          .map<ProductModel>((p) => ProductModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log("Erro ao buscar produtos", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar produtos");
    }
  }
}
