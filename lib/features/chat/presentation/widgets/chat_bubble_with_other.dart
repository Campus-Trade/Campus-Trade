import 'package:campus_trade/core/utils/resources/color_manager.dart';
import 'package:campus_trade/core/utils/resources/text_styles.dart';
import 'package:flutter/material.dart';

class ChatBubbleWithOther extends StatelessWidget {
  const ChatBubbleWithOther({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: ColorManager.SecondaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
        child: Text(
          "what is your name ?",
          style: TextStyles.White16Meduim,
        ),
      ),
    );
  }
}
