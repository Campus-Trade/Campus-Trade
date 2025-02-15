import 'package:depi/pages/signup_page.dart';
import 'package:depi/widget/button.dart';
import 'package:depi/widget/icon.dart';
import 'package:depi/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          /////////////////////////////////////////////////////////////////
          ///Stack(clipBehavior: Clip.none, children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                height: 160.h,
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
              Positioned(
                top: 20.h,
                left: 15.w,
                child: Text(
                  "Let's get you Login !",
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
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
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
                    color: const Color.fromARGB(255, 247, 73, 4),
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
          //////////////////////////////////////////////////////////////
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.r),
            child: Column(
              children: [
                SizedBox(height: 80.h),
                const CustomTextField(
                  hintText: 'Enter your Email',
                  isPassword: false,
                ),
                SizedBox(height: 22.h),
                const CustomTextField(
                  hintText: 'Password',
                  isPassword: true,
                ),
                SizedBox(height: 18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forget password ',
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: const Color.fromARGB(255, 247, 73, 4),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                CustomButton(
                  name: 'Login',
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.r),
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
                        icon: Image.asset('assets/image/facebook_1076990.png')),
                    const SizedBox(width: 16),
                    Item(icon: Image.asset('assets/image/social_14063314.png')),
                    const SizedBox(width: 16),
                    Item(icon: Image.asset('assets/image/apple_731985.png')),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t Have An Account?   ',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignupPage();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Register Here',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color.fromARGB(255, 247, 73, 4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
