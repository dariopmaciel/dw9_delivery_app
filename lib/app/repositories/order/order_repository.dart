import 'package:dark_week/app/models/payment_types_model.dart';
import 'package:dark_week/app/pages/order/widget/payment_types_field.dart';

abstract class OrderRepository {
  Future<List<PaymentTypesModel>> getAllPaymentsTypes();
}
