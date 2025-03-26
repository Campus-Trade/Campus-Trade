import 'package:campus_trade/presentation/authentication/widget/custom_button.dart';
import 'package:campus_trade/presentation/home/home_screen.dart';
import 'package:campus_trade/presentation/resources/color_manager.dart';
import 'package:campus_trade/presentation/resources/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/text_styles.dart';
import '../widget/CustomButton.dart';

class UploadPhoto extends StatelessWidget {
  const UploadPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.PrimaryColor,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 189),
          Image.asset(
            ImageManager.uploadPhoto,
          ),
          const SizedBox(height: 20),
          CustomButton(
              labelText: 'Upload Profile Picture',
              backgroundColor: ColorManager.SecondaryColor,
              textStyle: TextStyles.White16Meduim,
              width: 230.sp,
              height: 50.sp,
              onPressed: () {}),
          const SizedBox(height: 329),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                labelText: 'Skip',
                textStyle: TextStyles.blue14Bold,
                borderColor: ColorManager.SecondaryColor,
                backgroundColor: ColorManager.PrimaryColor,
                width: 135,
                height: 50,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                },
              ),
              const SizedBox(
                width: 10,
              ),
              CustomButton(
                labelText: 'Start',
                backgroundColor: ColorManager.SecondaryColor,
                textStyle: TextStyles.white14Bold,
                width: 208,
                height: 50,
                onPressed: () {
                  print('Start');
                },
                borderColor: ColorManager.PrimaryColor, // استخدام borderColor
              ),
            ],
          ),
        ],
      ),
    );
  }
}
