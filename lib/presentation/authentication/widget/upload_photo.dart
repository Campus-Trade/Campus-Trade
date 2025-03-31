import 'dart:io';
import 'package:campus_trade/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_manager.dart';
import '../../resources/image_manager.dart';
import '../../resources/text_styles.dart';
import 'custom_button.dart';

import 'package:image_picker/image_picker.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({super.key});

  @override
  _UploadPhotoState createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  File? selectedImage;

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
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
            ),
            SizedBox(height: 20.h),

            CustomButton(
              labelText: 'Upload Profile Picture',
              backgroundColor: ColorManager.SecondaryColor,
              textStyle: TextStyles.White16Meduim,
              width: 230.w,
              height: 50.h,
              onPressed: pickImage,
            ),

            SizedBox(height: 50.h),

            // Navigation Buttons
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
                      MaterialPageRoute(builder: (context) => HomeScreen()),
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
                  onPressed: () {
                    Navigator.pop(context, selectedImage);
                  },
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
