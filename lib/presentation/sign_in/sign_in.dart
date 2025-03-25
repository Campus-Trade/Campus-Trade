import 'package:flutter/material.dart';
import 'package:campus_trade/presentation/sign_in/widget/button.dart';
import 'package:campus_trade/presentation/sign_in/widget/facebook_button.dart';
import 'package:campus_trade/presentation/sign_in/widget/google_button.dart';
import '../resources/image_manager.dart';
import 'package:campus_trade/presentation/resources/color_manager.dart';
import 'widget/CustomButton.dart';
import 'widget/textField.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.PrimaryColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 70),
          Center(
            child: Image.asset(
              ImageManager.logoText,
              width: 171.84,
              height: 101,
            ),
          ),
          const SizedBox(height: 60),
          const text_field(
            hintText: 'Mobile number or email.',
          ),
          const SizedBox(height: 14),
          const text_field(
            hintText: 'Password',
            isPassword: true,
          ),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          CustomButton(
            width: 353,
            height: 42,
            name: "Sign In",
            onPressed: () {
              print("💀💀💀💀💀");
            },
            backgroundColor: const Color(0xff378BCB),
            textColor: Colors.white,
          ),

          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(
                child: Divider(color: Colors.grey, thickness: 2),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  ' OR ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                child: Divider(color: Colors.grey, thickness: 2),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Button(),
          const SizedBox(height: 12),
          const GoogleButton(),
          const SizedBox(height: 12),
          const FacebookButton(),
          const SizedBox(height: 70),
          /////////////////////////////////////////////
          const Center(
            child: Text.rich(
              TextSpan(
                text: 'By signing up, you accept our\n',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Terms of Service',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ', ',
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ', and use of ',
                  ),
                  TextSpan(
                    text: 'Cookies',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
