import 'package:flutter/material.dart';

import 'chat_card.dart';

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
