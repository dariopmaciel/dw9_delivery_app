import 'package:auto_size_text/auto_size_text.dart';
import 'package:dark_week/app/core/extensions/formater_extension.dart';
import 'package:dark_week/app/core/ui/base_state/base_state.dart';
import 'package:dark_week/app/core/ui/helpers/size_extensions.dart';
import 'package:dark_week/app/core/ui/styles/text_styler.dart';
import 'package:dark_week/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dark_week/app/models/product_model.dart';
import 'package:dark_week/app/pages/product_detail/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/widgets/delivery_increment_decremente_button.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailPage, ProductDetailController> {
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
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              image: DecorationImage(
                image: NetworkImage(widget.product.image),
                //estica a imagem sem distorcer a imagem, cortando as estremidades
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.product.name,
              style: context.textStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Text(
                  widget.product.description,
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
                child: BlocBuilder<ProductDetailController, int>(
                  builder: (context, amout) {
                    return DeliveryIncrementDecrementeButton(
                      decrementTap: () {
                        controller.decrement();
                        print("Decremento");
                      },
                      incrementTap: () {
                        controller.increment();
                        print("Incremento");
                      },
                      amout: amout,
                    );
                  },
                ),
              ),
              Container(
                width: context.percentWidth(0.5),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: BlocBuilder<ProductDetailController, int>(
                  builder: (context, amount) {
                    return ElevatedButton(
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
                              (widget.product.price * amount).currencyPTBR,
                              maxFontSize: 13,
                              minFontSize: 8,
                              maxLines: 1,
                              style: context.textStyles.textExtraBold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
