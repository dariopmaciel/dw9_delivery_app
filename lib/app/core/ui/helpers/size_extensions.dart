import 'dart:core';

import 'package:flutter/material.dart';

//Esta extenção serve para definir os tamanho gerais das telas...
//MUITO UTIL

extension SizeExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  double percentWidth(double percent) => screenWidth * percent;
  double percentHeight(double percent) => screenHeight * percent;
}
