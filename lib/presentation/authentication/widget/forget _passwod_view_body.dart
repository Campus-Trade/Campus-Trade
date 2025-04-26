import 'package:campus_trade/presentation/authentication/widget/textField.dart';
import 'package:campus_trade/presentation/resources/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Cubit/forget_password_cubit/forget_password_cubit.dart';
import '../../resources/color_manager.dart';
import 'custom_button.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: ColorManager.PrimaryColor,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: ColorManager.SecondaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 66,
                      right: 100,
                      top: 90,
                      bottom: 76,
                    ),
                    child: Image.asset("assets/images/logo_text.png"),
                  ),
                ],
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Enter the email associated with your \n account.",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto_Condensed',
                    fontWeight: FontWeight.w700,
                    color: ColorManager.blackColor,
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                hintText: "Email",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              Spacer(),
              CustomButton(
                labelText: 'send',
                backgroundColor: ColorManager.SecondaryColor,
                textStyle: TextStyles.white14Bold,
                onPressed: () {
                  final email = emailController.text.trim();

                  if (email.isNotEmpty) {
                    context.read<ForgetPasswordCubit>().forgetPassword(email);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter your email')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
