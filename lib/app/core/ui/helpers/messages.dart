import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showError() {}

  void showInfo() {}

  void showSuccess() {}
}
