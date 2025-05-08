import 'package:campus_trade/core/utils/resources/color_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageSend extends StatelessWidget {
  const MessageSend({
    super.key,
    required this.messages,
    required this.id,
    required this.messageController,
    required this.listController,
  });

  final CollectionReference<Object?> messages;
  final String id;
  final TextEditingController messageController;
  final ScrollController listController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (String message) {
        messages.add({
          'message': message,
          'id': id,
          'timestamp': DateTime.now(),
        });
        messageController.clear();
        listController.jumpTo(
          listController.position.maxScrollExtent,
        );
      },
      controller: messageController,
      decoration: InputDecoration(
          hintText: 'Write your message',
          suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send, color: ColorManager.SecondaryColor)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.SecondaryColor),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12)))),
    );
  }
}
