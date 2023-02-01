import 'package:dark_week/app/core/ui/theme/theme_config.dart';
import 'package:dark_week/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Dw9DeliveryApp extends StatelessWidget {
  const Dw9DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Delivery App",
      theme: ThemeConfig.theme,
      routes: {
        "/": (context) => const SplashPage(),
      },
    );
  }
}
