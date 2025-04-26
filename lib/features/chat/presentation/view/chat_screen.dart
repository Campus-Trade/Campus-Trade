import 'package:flutter/material.dart';

import '../widgets/chat_card_list.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatCardList(),
    );
  }
}
