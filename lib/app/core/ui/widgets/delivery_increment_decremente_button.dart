import 'package:dark_week/app/core/ui/helpers/size_extensions.dart';
import 'package:dark_week/app/core/ui/styles/colors_app.dart';
import 'package:dark_week/app/core/ui/styles/text_styler.dart';
import 'package:flutter/material.dart';

class DeliveryIncrementDecrementeButton extends StatelessWidget {
  const DeliveryIncrementDecrementeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "-",
              style: context.textStyles.textMidium.copyWith(
                fontSize: 22,
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            "1",
            style: context.textStyles.textRegular
                .copyWith(fontSize: 17, color: context.colors?.secondary),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "+",
              style: context.textStyles.textMidium.copyWith(
                fontSize: 22,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
