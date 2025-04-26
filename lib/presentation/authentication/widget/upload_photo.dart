import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Cubit/signup_cubit/signup_cubit.dart';
import '../../resources/color_manager.dart';
import '../../resources/image_manager.dart';
import '../../resources/text_styles.dart';
import '../view/signin_view.dart';
import 'custom_button.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({super.key});

  @override
  _UploadPhotoState createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  File? selectedImage;
  bool isUploading = false;

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadAndNavigate(BuildContext context) async {
    if (selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please upload an image first')),
      );
      return;
    }

    setState(() => isUploading = true);

    try {
      final signupCubit = context.read<SignupCubit>();
      // استدعاء دالة رفع الصورة مباشرة من الـSignupCubit
      //final imageUrl = await signupCubit.uploadProfileImage(selectedImage!);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SigninView(),
       //   settings: RouteSettings(arguments: imageUrl),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload image: $e')),
      );
    } finally {
      setState(() => isUploading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.PrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image preview
            CircleAvatar(
              radius: 75.r,
              backgroundColor: Colors.grey[300],
              backgroundImage: selectedImage != null
                  ? FileImage(selectedImage!)
                  : AssetImage(ImageManager.uploadPhoto) as ImageProvider,
              child: isUploading ? CircularProgressIndicator() : null,
            ),
            SizedBox(height: 20.h),

            if (!isUploading)
              CustomButton(
                labelText: 'Upload Profile Picture',
                backgroundColor: ColorManager.SecondaryColor,
                textStyle: TextStyles.White16Meduim,
                width: 230.w,
                height: 50.h,
                onPressed: pickImage,
              ),

            SizedBox(height: 50.h),

            if (!isUploading)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    labelText: 'Skip',
                    textStyle: TextStyles.blue14Bold,
                    borderColor: ColorManager.SecondaryColor,
                    backgroundColor: ColorManager.PrimaryColor,
                    width: 135.w,
                    height: 50.h,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SigninView()),
                      );
                    },
                  ),
                  SizedBox(width: 10.w),
                  CustomButton(
                    labelText: 'Start',
                    backgroundColor: ColorManager.SecondaryColor,
                    textStyle: TextStyles.white14Bold,
                    width: 208.w,
                    height: 50.h,
                    onPressed: () => _uploadAndNavigate(context),
                    borderColor: ColorManager.PrimaryColor,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
