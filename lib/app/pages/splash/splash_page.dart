import 'package:dark_week/app/core/config/env/env.dart';
import 'package:dark_week/app/core/ui/helpers/size_extensions.dart';
import 'package:dark_week/app/core/ui/styles/app_styles.dart';
import 'package:dark_week/app/core/ui/styles/colors_app.dart';
import 'package:dark_week/app/core/ui/widgets/delivery_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
//Theme.of(context).primaryColor;
//é igua a:
//definições de primaries do APP
    return Scaffold(
      body: ColoredBox(
        color: const Color(0xff140e0e),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  "assets/images/lanche.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.screenHeight * 0.15,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                  ),
                  const SizedBox(height: 80),
                  DeliveryButtom(
                    width: context.percentWidth(.5),
                    height: 35,
                    label: "ACESSAR",
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
