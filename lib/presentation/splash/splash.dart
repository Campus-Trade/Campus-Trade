import 'package:campus_trade/presentation/onboarding/onboarding.dart';
import 'package:campus_trade/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import '../resources/image_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Onboarding()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.PrimaryColor,
      body: Center(
        child: Image.asset(ImageManager.logo),
      ),
    );
  }
}
