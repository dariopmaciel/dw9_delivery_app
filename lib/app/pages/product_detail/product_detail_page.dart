import 'package:auto_size_text/auto_size_text.dart';
import 'package:dark_week/app/core/ui/helpers/size_extensions.dart';
import 'package:dark_week/app/core/ui/styles/text_styler.dart';
import 'package:dark_week/app/core/ui/widgets/delivery_appbar.dart';
import 'package:flutter/material.dart';

import '../../core/ui/widgets/delivery_increment_decremente_button.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(0.4),
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              image: DecorationImage(
                image: NetworkImage(
                    "https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800"),
                //estica a imagem sem distorcer a imagem, cortando as estremidades
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "X - Burguer",
              style: context.textStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(height: 10),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Text(
                  "Lanche acomplanha, pão hamburguer, mussarela, catchup e maionese",
                  //style: context.textStyles.textBold.copyWith(fontSize: 16),
                ),
              ),
            ),
          ),
          const Divider(color: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: context.percentWidth(.5),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: const DeliveryIncrementDecrementeButton(),
              ),
              Container(
                width: context.percentWidth(0.5),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Adicionar",
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 13),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: AutoSizeText(
                          r"R$699,99",
                          maxFontSize: 13,
                          minFontSize: 8,
                          maxLines: 1,
                          style: context.textStyles.textExtraBold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
