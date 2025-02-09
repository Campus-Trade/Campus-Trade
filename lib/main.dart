import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const CampusTrade());
}

class CampusTrade extends StatelessWidget {
  const CampusTrade({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
