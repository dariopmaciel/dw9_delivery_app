import 'package:dark_week/app/dto/order_product_dto.dart';
import 'package:dark_week/app/core/extensions/formater_extension.dart';
import 'package:dark_week/app/core/ui/styles/colors_app.dart';
import 'package:dark_week/app/core/ui/styles/text_styler.dart';
import 'package:dark_week/app/models/product_model.dart';
import 'package:dark_week/app/pages/home/home_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel product;
  final OrderProductDto? orderProduct;

  const DeliveryProductTile(
      {super.key, required this.product, this.orderProduct});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final controller = context.read<HomeController>();
        final orderProductResult =
            await Navigator.of(context).pushNamed("/productDetail", arguments: {
          "product": product,
          "order": orderProduct,
        });
        if (orderProductResult != null) {
          controller.addOrUpdateBag(orderProductResult as OrderProductDto);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      product.name,
                      style: context.textStyles.textExtraBold
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Pão americanos, blend de 120g, mussarela, tomate, maionese da casa. ",
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 13),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      product.price.currencyPTBR,
                      style: context.textStyles.textMidium.copyWith(
                          fontSize: 12, color: context.colors!.secondary),
                    ),
                  ),
                ],
              ),
            ),
            FadeInImage.assetNetwork(
              placeholder: "assets/images/loading.gif",
              image: product.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
