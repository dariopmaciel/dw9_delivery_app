import 'package:dark_week/app/core/config/env/env.dart';
import 'package:flutter/material.dart';

import 'app/dw9_delivery_app.dart';

void main() async {
  await Env.i.load();
  runApp(const Dw9DeliveryApp());
}

 //01:14:00