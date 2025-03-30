import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/image_manager.dart';
import 'package:campus_trade/presentation/resources/color_manager.dart';
import '../../resources/text_styles.dart';
import '../widget/CustomButton.dart';
import '../widget/facebook_button.dart';
import '../widget/google_button.dart';
import '../widget/textField.dart';
import '../widget/custom_button.dart';
import 'sign_up.dart';
import 'upload_photo.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.PrimaryColor,
      body: Form(
        key: _globalKey,
        child: ListView(
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
            const CustomTextFormField(
              hintText: 'Mobile number or email.',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 14),
            const CustomTextFormField(
              hintText: 'Password',
              isPassword: true,
              keyboardType: TextInputType.text,
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
              labelText: "Sign In",
              backgroundColor: ColorManager.SecondaryColor,
              textStyle: TextStyles.white14Bold,
              onPressed: () {
                if (_globalKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UploadPhoto(),
                    ),
                  );
                }
              },
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
            CustomButton(
              labelText: "Create New Account",
              backgroundColor: ColorManager.PrimaryColor,
              borderColor: ColorManager.SecondaryColor,
              textStyle: TextStyles.blue14Bold,
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return SignUp();
                }));
              },
            ),
            const SizedBox(height: 12),
            CustomButton(
              labelText: "Continue with Google",
              backgroundColor: ColorManager.PrimaryColor,
              borderColor: ColorManager.greyColor,
              textStyle: TextStyles.black14Bold,
              iconPath: ImageManager.google,
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            CustomButton(
              labelText: "Continue with Facebook",
              backgroundColor: ColorManager.brightBlue,
              borderColor: ColorManager.brightBlue,
              textStyle: TextStyles.white14Bold,
              iconPath: ImageManager.facebook,
              onPressed: () {},
            ),
            const SizedBox(height: 12),

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
      ),
    );
  }
}
