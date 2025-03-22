import 'package:campus_trade/presentation/resources/color_manager.dart';
import 'package:campus_trade/presentation/resources/text_styles.dart';
import 'package:flutter/material.dart';

class ItemShowWidget extends StatelessWidget {
  const ItemShowWidget({super.key, required this.title, required this.text});
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyles.black20Bold.copyWith(),
          ),
          const Spacer(),
          Text(
            text,
            style: TextStyles.white14Bold.copyWith(
              decoration: TextDecoration.underline,
              color: ColorManager.blackColor,
            ),
          )
        ],
      ),
    );
  }
}
