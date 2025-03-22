import 'package:campus_trade/campus_trade_app.dart';
import 'package:campus_trade/core/services/get_it_sevice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/services/notification_service.dart';
import 'features/notification/data/product_state_listener.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService.initialize();

  final userId =
      FirebaseAuth.instance.currentUser?.uid; // Get from your auth system
  ProductStateListener(FirebaseFirestore.instance).listen(userId!);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  runApp(const CampusTradeApp());
}
