import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/image_manager.dart';
import '../sign_in/widget/textField.dart';
import '../sign_in/widget/dropDown.dart';
import '../sign_in/sign_in.dart';
import '../sign_in/widget/CustomButton.dart';
import '../sign_up/upload_photo.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
          const SizedBox(height: 20),
          const Row(
            children: [
              text_field(
                width: 171,
                height: 47,
                hintText: 'First Name',
              ),
              SizedBox(
                width: 10,
              ),
              text_field(
                width: 171,
                height: 47,
                hintText: 'Last Name',
              ),
            ],
          ),
          const SizedBox(height: 14),
          const text_field(
            hintText: 'Mobile number',
          ),
          const SizedBox(height: 14),
          const text_field(
            hintText: 'Email',
          ),
          const SizedBox(height: 14),
          const text_field(
            hintText: 'Password',
            isPassword: true,
          ),
          const SizedBox(height: 14),
          const text_field(
            hintText: 'Confirm Password',
            isPassword: true,
          ),
          const SizedBox(height: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'University',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  // const SizedBox(width: 1),
                  IconButton(
                    icon: const Icon(
                      Icons.help_outline,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('University'),
                            content: const Text(
                                'Please select your university from the list.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
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
            ],
          ),
          Dropdown(),
          Row(
            children: [
              const Text(
                'Faculty',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              // const SizedBox(width: 1),
              IconButton(
                icon: const Icon(
                  Icons.help_outline,
                  color: Colors.grey,
                  size: 20,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Faculty'),
                        content: const Text(
                            'Please select your Faculty from the list.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
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
          CustomButton(
            width: 353,
            height: 42,
            backgroundColor: const Color(0xff378BCB),
            textColor: Colors.white,
            name: 'Next',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UploadPhoto()),
              );
            },
          ),
          const SizedBox(height: 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?   ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignIn();
                      },
                    ),
                  );
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff378BCB),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
