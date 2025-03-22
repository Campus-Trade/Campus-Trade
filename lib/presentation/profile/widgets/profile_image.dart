import 'package:campus_trade/presentation/resources/color_manager.dart';
import 'package:campus_trade/presentation/resources/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(
            width: 5,
            color: ColorManager.SecondaryColor,
          )),
      child: CircleAvatar(
        radius: 60.r,
        backgroundImage: const AssetImage(
          ImageManager.ellipse,
        ),
      ),
    );
  }
}
