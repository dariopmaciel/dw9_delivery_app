import 'package:dark_week/app/dto/order_product_dto.dart';
import 'package:dark_week/app/core/extensions/formater_extension.dart';
import 'package:dark_week/app/core/ui/helpers/size_extensions.dart';
import 'package:dark_week/app/core/ui/styles/text_styler.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingBagWidget extends StatelessWidget {
  final List<OrderProductDto> bag;

  const ShoppingBagWidget({super.key, required this.bag});

  Future<void> _goOrder(BuildContext context) async {
    final navigator = Navigator.of(context);
    final sharedpre = await SharedPreferences.getInstance();

    if (!sharedpre.containsKey("accessToken")) {
      //se não estiver logado, envio para login
      final loginResult = await navigator.pushNamed('/auth/login');
      //precisa verificar se sair da tela de login, precisa sair com o login efetuado
      if (loginResult == null || loginResult == false) {
        return;
      }
    }
    await navigator.pushNamed("/order", arguments: bag);
  }

  @override
  Widget build(BuildContext context) {
    var totalBag = bag
        .fold<double>(0.0, (total, element) => total += element.totalPrice)
        .currencyPTBR;

    return Container(
      padding: const EdgeInsets.all(15),
      width: context.screenWidth,
      height: 90,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 5,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          _goOrder(context);
        },
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.red,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "VER SACOLA",
                style: context.textStyles.textExtraBold.copyWith(fontSize: 14),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                totalBag,
                style: context.textStyles.textExtraBold.copyWith(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
