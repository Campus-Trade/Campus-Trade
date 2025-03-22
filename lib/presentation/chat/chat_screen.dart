import 'package:campus_trade/presentation/chat/widgets/chat_card_list.dart';

import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatCardList(),
    );
  }
}
