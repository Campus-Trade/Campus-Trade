import 'package:campus_trade/core/utils/resources/color_manager.dart';
import 'package:campus_trade/features/chat/data/models/message_model.dart';
import 'package:campus_trade/features/chat/presentation/widgets/chat_app_bar.dart';
import 'package:campus_trade/features/chat/presentation/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatelessWidget {
  ConversationScreen({super.key});
  final TextEditingController messageController = TextEditingController();
  final ScrollController listController = ScrollController();

  final CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    final id = FirebaseAuth.instance.currentUser!.email!;

    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('timestamp', descending: false).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messageList = snapshot.data!.docs.map((doc) {
              return MessageModel.fromjson(doc.data());
            }).toList();

            return Scaffold(
              appBar: const ChatAppBar(title: 'Mohab Mohamed'),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {
                      return const ChatBubble();
                    }),
                  ),
                  TextField(
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
                            icon: const Icon(Icons.send,
                                color: ColorManager.SecondaryColor)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.SecondaryColor),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12)))),
                  )
                ],
              ),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Has Error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
