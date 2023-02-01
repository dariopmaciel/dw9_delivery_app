import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp? get i {
    _instance ??= ColorsApp._();
    return _instance;
  }

  Color get primary => const Color(0xff007d21);
  Color get secondary => const Color(0xfff88b0c);
}

//esta extenção permite acelerar o verbose de:
//Theme.of(context).primaryColor;
//para:
//context.colors.primary;
extension ColorsAppExcetions on BuildContext {
  ColorsApp? get colors => ColorsApp.i;
}
