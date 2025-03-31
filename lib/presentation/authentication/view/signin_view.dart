import 'package:campus_trade/presentation/authentication/widget/signin_view_body.dart';
import 'package:flutter/material.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInViewBody(),
    );
  }
}
