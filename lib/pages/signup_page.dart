import 'package:depi/pages/login_page.dart';
import 'package:depi/widget/button.dart';
import 'package:depi/widget/icon.dart';
import 'package:depi/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  height: 160.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20).w,
                      bottomRight: Radius.circular(20).w,
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff1E4174),
                        Color(0xff074799),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 45.h,
                  left: 15.w,
                  child: Text(
                    "Let's get you Registered !",
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ///////////////////////////////////////////////
                Positioned(
                  left: 25.w,
                  bottom: -20.h,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40).w,
                      color: Color.fromARGB(255, 247, 73, 4),
                    ),
                    width: 180.w,
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
                      child: const Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ///////////////////////////////////////////////
                Positioned(
                  left: 160.w,
                  bottom: -20.h,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40).w,
                      color: Colors.white,
                    ),
                    width: 180.w,
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
              padding: const EdgeInsets.symmetric(horizontal: 20).w,
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  const CustomTextField(
                    hintText: 'Full Name',
                    isPassword: false,
                  ),
                  SizedBox(height: 22.h),
                  const CustomTextField(
                    hintText: 'Email Address',
                    isPassword: false,
                  ),
                  SizedBox(height: 22.h),
                  const CustomTextField(
                    hintText: 'Password',
                    isPassword: true,
                  ),
                  SizedBox(height: 22.h),
                  const CustomTextField(
                    hintText: 'Confirm Password',
                    isPassword: true,
                  ),
                  SizedBox(height: 18.h),
                  CustomButton(
                    name: 'Register',
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8).w,
                        child: Text(
                          'Or login with',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
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
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Have An Account ? ',
                        style: TextStyle(
                          fontSize: 13.sp,
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
                        child: Text(
                          'Login Now',
                          style: TextStyle(
                            fontSize: 16.sp,
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
