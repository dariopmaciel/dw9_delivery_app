import 'package:dark_week/app/core/ui/base_state/base_state.dart';
import 'package:dark_week/app/core/ui/styles/colors_app.dart';
import 'package:dark_week/app/core/ui/styles/text_styler.dart';
import 'package:dark_week/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dark_week/app/core/ui/widgets/delivery_buttom.dart';
import 'package:dark_week/app/dto/order_product_dto.dart';
import 'package:dark_week/app/models/product_model.dart';
import 'package:dark_week/app/pages/order/order_controller.dart';
import 'package:dark_week/app/pages/order/order_state.dart';

import 'package:dark_week/app/pages/order/widget/order_field.dart';
import 'package:dark_week/app/pages/order/widget/order_product_tile.dart';
import 'package:dark_week/app/pages/order/widget/payment_types_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
  @override
  void onReady() {
    // TODO: implement onReady
    final products =
        ModalRoute.of(context)!.settings.arguments as List<OrderProductDto>;
    controller.load(products);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "CARRINHO",
                          style: context.textStyles.textTitle,
                        ),
                        IconButton(
                          onPressed: () {
                            //
                          },
                          icon: Image.asset(
                            "assets/images/trashRegular.png",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocSelector<OrderController, OrderState, List<OrderProductDto>>(
            selector: (state) => state.orderProducts,
            builder: (context, orderProducts) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: orderProducts.length,
                  (context, index) {
                    final orderProduct = orderProducts[index];
                    return Column(
                      children: [
                        //Text("Produto $index"),
                        OrderProductTile(
                            index: index, orderProduct: orderProduct),
                        const Divider(color: Colors.grey),
                      ],
                    );
                  },
                ),
              );
            },
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TOTAL PEDIDO",
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 20),
                      ),
                      Text(
                        r"R$ 200,00",
                        style:
                            context.textStyles.textBold.copyWith(fontSize: 30),
                      ),
                    ],
                  ),
                ),
                Divider(color: context.colors?.secondary, thickness: 2),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(children: [
                      OrderField(
                        title: "Qual o endereço de entrega?",
                        controller: TextEditingController(),
                        validator: Validatorless.required(""),
                        hintText: "Digite endereço:",
                      ),
                      const SizedBox(height: 10),
                      OrderField(
                        title: "De quem é o pedido?",
                        controller: TextEditingController(),
                        validator: Validatorless.required(""),
                        hintText: "Digite o nome:",
                      ),
                    ]),
                  ),
                ),
                Divider(color: context.colors?.secondary, thickness: 2),
                const PaymentTypesField(),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(color: context.colors?.secondary, thickness: 2),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DeliveryButtom(
                      width: double.infinity,
                      height: 62,
                      label: "FAZER PEDIDO",
                      onPressed: () {
                        //
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
