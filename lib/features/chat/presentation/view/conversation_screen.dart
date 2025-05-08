import 'package:campus_trade/features/chat/data/models/message_model.dart';
import 'package:campus_trade/features/chat/presentation/widgets/chat_app_bar.dart';
import 'package:campus_trade/features/chat/presentation/widgets/chat_bubble.dart';
import 'package:campus_trade/features/chat/presentation/widgets/chat_bubble_with_other.dart';
import 'package:campus_trade/features/chat/presentation/widgets/message_send.dart';
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
    var id = FirebaseAuth.instance.currentUser!.email!;

    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('timestamp', descending: false).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<MessageModel> messageList =
                snapshot.data!.docs.map((doc) {
              return MessageModel.fromjson(doc.data());
            }).toList();

            return Scaffold(
              appBar: const ChatAppBar(title: 'Mohab Mohamed'),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: messageList.length,
                        itemBuilder: (context, index) {
                          final message = messageList[index];
                          return id == messages.id
                              ? ChatBubble(
                                  messageModel: message,
                                )
                              : ChatBubbleWithOther(
                                  messageModel: message,
                                );
                        }),
                  ),
                  MessageSend(
                      messages: messages,
                      id: id,
                      messageController: messageController,
                      listController: listController)
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
