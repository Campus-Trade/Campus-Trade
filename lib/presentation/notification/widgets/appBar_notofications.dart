import 'package:campus_trade/presentation/resources/color_manager.dart';
import 'package:campus_trade/presentation/resources/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarNotifications extends StatelessWidget
    implements PreferredSizeWidget {
  const AppbarNotifications({super.key});

  @override
  Size get preferredSize => Size.fromHeight(140.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: const BoxDecoration(
        color: ColorManager.SecondaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
        ),
      ),
      padding: EdgeInsets.fromLTRB(16.w, 70.h, 16.h, 30.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              ImageManager.backButton,
            ),
          ),
          const Spacer(),
          InkWell(
            child: Image.asset(ImageManager.cartButton),
          ),
          SizedBox(
            width: 16.w,
          ),
          InkWell(
            child: Image.asset(ImageManager.ellipse),
          )
        ],
      ),
    );
  }
}
