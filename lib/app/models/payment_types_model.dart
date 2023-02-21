// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PaymentTypesModel {
  final int id;
  final String name;
  final String acronym;
  final bool enable;

  PaymentTypesModel(
    this.id,
    this.name,
    this.acronym,
    this.enable,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'acronym': acronym,
      'enable': enable,
    };
  }

  factory PaymentTypesModel.fromMap(Map<String, dynamic> map) {
    return PaymentTypesModel(
      map['id'] as int,
      map['name'] as String,
      map['acronym'] as String,
      map['enable'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentTypesModel.fromJson(String source) => PaymentTypesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
