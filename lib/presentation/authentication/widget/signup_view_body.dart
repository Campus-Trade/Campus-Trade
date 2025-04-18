import 'dart:io';
import 'package:campus_trade/presentation/authentication/widget/textField.dart';
import 'package:campus_trade/presentation/authentication/widget/upload_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Cubit/signup_cubit/signup_cubit.dart';
import '../../resources/color_manager.dart';
import '../../resources/image_manager.dart';
import '../../resources/text_styles.dart';
import '../view/signin_view.dart';
import 'custom_button.dart';
import 'package:provider/provider.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _facultyController = TextEditingController();

  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _globalKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ListView(
              children: [
                SizedBox(height: 70.h),
                Center(
                  child: Image.asset(
                    ImageManager.logoText,
                    width: 150.w,
                    height: 100.h,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                          controller: _firstNameController,
                          hintText: 'First Name',
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'field can\'t be empty';
                            }
                          }),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CustomTextFormField(
                          controller: _lastNameController,
                          hintText: 'Last Name',
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'field can\'t be empty';
                            }
                          }),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                    controller: _mobileNumberController,
                    hintText: 'Mobile number',
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field can\'t be empty';
                      }
                    }),
                SizedBox(height: 16.h),
                CustomTextFormField(
                    controller: _emailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field can\'t be empty';
                      }
                    }),
                SizedBox(height: 16.h),
                CustomTextFormField(
                    controller: _passwordController,
                    hintText: 'Password',
                    isPassword: true,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field can\'t be empty';
                      }
                    }),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm Password',
                  isPassword: true,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'field can\'t be empty';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                    controller: _universityController,
                    hintText: 'University',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field can\'t be empty';
                      }
                    }),
                SizedBox(height: 16.h),
                CustomTextFormField(
                    controller: _facultyController,
                    hintText: 'Faculty',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field can\'t be empty';
                      }
                    }),
                SizedBox(height: 30.h),
                CustomButton(
                  labelText: "Sign Up",
                  backgroundColor: ColorManager.SecondaryColor,
                  textStyle: TextStyles.white14Bold,
                  onPressed: () async {
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();

                      final imageFile = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadPhoto(),
                        ),
                      );

                      if (imageFile != null) {
                        selectedImage = imageFile;
                      }

                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            mobileNumber: _mobileNumberController.text,
                            imageFile: selectedImage,
                            university: _universityController.text,
                            faculty: _facultyController.text,
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
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SigninView()),
                      ),
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
        ));
  }
}

// Row(
//   children: [
//     const Text(
//       'Faculty:',
//       style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//           color: Colors.grey),
//     ),
//     IconButton(
//       icon: const Icon(Icons.help_outline,
//           color: Colors.grey, size: 20),
//       onPressed: () {
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: const Text('Faculty Info'),
//               content: const Text(
//                   'Please select your faculty from the list.'),
//               actions: [
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text('OK'),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     ),
//   ],
// ),
// Dropdown(),
