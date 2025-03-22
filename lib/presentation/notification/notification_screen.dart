import 'package:campus_trade/presentation/notification/widgets/appBar_notofications.dart';
import 'package:campus_trade/presentation/notification/widgets/notefication_card.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarNotifications(),
      body: SingleChildScrollView(
        child: Column(
          children: [NoteficationCard()],
        ),
      ),
    );
  }
}
