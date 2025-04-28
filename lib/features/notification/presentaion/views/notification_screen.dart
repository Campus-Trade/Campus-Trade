import 'package:flutter/material.dart';

import '../widgets/appBar_notofications.dart';
import '../widgets/notefication_card.dart';

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
