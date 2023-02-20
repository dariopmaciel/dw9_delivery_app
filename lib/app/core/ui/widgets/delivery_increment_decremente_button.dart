import 'package:dark_week/app/core/ui/helpers/size_extensions.dart';
import 'package:dark_week/app/core/ui/styles/colors_app.dart';
import 'package:dark_week/app/core/ui/styles/text_styler.dart';
import 'package:flutter/material.dart';

class DeliveryIncrementDecrementeButton extends StatelessWidget {
  final int amout;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;
  final bool _compact;

  const DeliveryIncrementDecrementeButton({
    super.key,
    required this.amout,
    required this.incrementTap,
    required this.decrementTap,
  }) : _compact = false;

  const DeliveryIncrementDecrementeButton.compact({
    super.key,
    required this.amout,
    required this.incrementTap,
    required this.decrementTap,
  }) : _compact = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _compact ? const EdgeInsets.all(6) : null,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: decrementTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "-",
                style: context.textStyles.textMidium.copyWith(
                  fontSize: _compact ? 18 : 22,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Text(
            amout.toString(),
            style: context.textStyles.textRegular.copyWith(
                fontSize: _compact ? 13 : 17, color: context.colors?.secondary),
          ),
          InkWell(
            onTap: incrementTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "+",
                style: context.textStyles.textMidium.copyWith(
                  fontSize: _compact ? 18 : 22,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
