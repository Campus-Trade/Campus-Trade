import 'package:campus_trade/presentation/resources/color_manager.dart';
import 'package:campus_trade/presentation/resources/image_manager.dart';
import 'package:campus_trade/presentation/sign_in/widget/CustomButton.dart';
import 'package:flutter/material.dart';

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
            width: 230,
            height: 44,
            name: 'Upload Profile Picture',
            backgroundColor: const Color(0xff378BCB),
            textColor: Colors.white,
            onPressed: () {
              print('Upload Profile Picture');
            },
            icon: const Icon(Icons.upload),
          ),
          const SizedBox(height: 329),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                name: 'Skip',
                backgroundColor: ColorManager.PrimaryColor,
                textColor: ColorManager.SecondaryColor,
                width: 135,
                height: 42,
                onPressed: () {
                  print('Skip');
                },
              ),
              const SizedBox(
                width: 10,
              ),
              CustomButton(
                name: 'Start',
                backgroundColor: ColorManager.SecondaryColor,
                textColor: ColorManager.PrimaryColor,
                width: 208,
                height: 44,
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
