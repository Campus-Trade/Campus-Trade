import 'package:flutter/material.dart';
import '../../resources/color_manager.dart';
import '../../resources/image_manager.dart';

import '../../resources/text_styles.dart';
import '../widget/CustomButton.dart';
import '../widget/dropDown.dart';
import '../widget/textField.dart';
import 'sign_in.dart';

import 'upload_photo.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            children: [
              const SizedBox(height: 70),
              Center(
                child: Image.asset(
                  ImageManager.logoText,
                  width: 150,
                  height: 100,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hintText: 'First Name',
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFormField(
                      hintText: 'Last Name',
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Mobile number',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Password',
                isPassword: true,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Confirm Password',
                isPassword: true,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'University',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Faculty:',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  IconButton(
                    icon: const Icon(Icons.help_outline,
                        color: Colors.grey, size: 20),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Faculty Info'),
                            content: const Text(
                                'Please select your faculty from the list.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              Dropdown(),
              const SizedBox(height: 30),
              CustomButtonnn(
                name: "Next",
                width: 353,
                height: 42,
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
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? ',
                      style: TextStyle(color: Colors.black)),
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn())),
                    child: Text(
                      'Sign In',
                      style: TextStyles.blue12Medium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
