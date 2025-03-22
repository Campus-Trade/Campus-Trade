import 'package:campus_trade/presentation/chat/widgets/chat_card.dart';
import 'package:flutter/material.dart';

class ChatCardList extends StatelessWidget {
  const ChatCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ChatCard();
        });
  }
}
