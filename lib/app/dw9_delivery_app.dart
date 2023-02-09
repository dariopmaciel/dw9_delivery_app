import 'package:dark_week/app/core/provider/aplication_binding.dart';
import 'package:dark_week/app/core/ui/theme/theme_config.dart';
import 'package:dark_week/app/pages/auth/login/login_page.dart';

import 'package:dark_week/app/pages/auth/register/register_router.dart';
import 'package:dark_week/app/pages/home/home_router.dart';

import 'package:dark_week/app/pages/product_detail/product_detail_router.dart';
import 'package:dark_week/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class Dw9DeliveryApp extends StatelessWidget {
  const Dw9DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Delivery App",
        theme: ThemeConfig.theme,
        routes: {
          "/": (context) => const SplashPage(),
          "/home": (context) => HomeRouter.page,
          "/productDetail": (context) => ProductDetailRouter.page, //5:07
          "/auth/login": (context) => const LoginPage(),
          "/auth/register": (context) => RegisterRouter.page,
        },
      ),
    );
  }
}
