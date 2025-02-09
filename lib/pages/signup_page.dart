import 'package:depi/pages/login_page.dart';
import 'package:depi/widget/button.dart';
import 'package:depi/widget/icon.dart';
import 'package:depi/widget/text_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ///////////////////////////////////
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  height: 160,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff1E4174),
                        Color(0xff074799),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                const Positioned(
                  top: 45,
                  left: 15,
                  child: Text(
                    "Let's get you Registered !",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ///////////////////////////////////////////////
                Positioned(
                  left: 30,
                  bottom: -20,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.orange,
                    ),
                    width: 200,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignupPage();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                ///////////////////////////////////////////////
                Positioned(
                  left: 170,
                  bottom: -20,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),
                    width: 200,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const LoginPage();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /////////////////////////
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const CustomTextField(
                    hintText: 'Full Name',
                    isPassword: false,
                  ),
                  const SizedBox(height: 22),
                  const CustomTextField(
                    hintText: 'Email Address',
                    isPassword: false,
                  ),
                  const SizedBox(height: 22),
                  const CustomTextField(
                    hintText: 'Password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 22),
                  const CustomTextField(
                    hintText: 'Confirm Password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 18),
                  CustomButton(
                    name: 'Register',
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Or login with',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Item(
                          icon:
                              Image.asset('assets/image/facebook_1076990.png')),
                      const SizedBox(width: 16),
                      Item(
                          icon:
                              Image.asset('assets/image/social_14063314.png')),
                      const SizedBox(width: 16),
                      Item(icon: Image.asset('assets/image/apple_731985.png')),
                    ],
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already Have An Account   ',
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
                                return const LoginPage();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Login Now',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 247, 73, 4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
