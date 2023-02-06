import 'package:dark_week/app/core/ui/helpers/loader.dart';
import 'package:dark_week/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dark_week/app/models/product_model.dart';
import 'package:dark_week/app/pages/home/widget/delivery_product_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showLoader();
        Future.delayed(Duration(seconds: 2));
      }),
      appBar: DeliveryAppbar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return DeliveryProductTile(
                  product: ProductModel(
                    id: 0,
                    name: "Lanche X",
                    description: "DESCRIÇÃO",
                    price: 25,
                    image:
                        "https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800",
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
