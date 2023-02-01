// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dark_week/app/core/rest_client/custom_dio.dart';
import 'package:dark_week/app/models/product_model.dart';

import './products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final CustomDio dio;

  ProductsRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<ProductModel>> findAllProducts() async {
    final result = await dio.unauth().get("/products");
    // se não colocar <ProductModel> irá falar que list de dynamic não é lista de Productmodel
    //pois não faz o cast automaticamente
    return result.data
        .map<ProductModel>((p) => ProductModel.fromMap(p))
        .toList();
  }
}
