import 'package:campus_trade/presentation/resources/color_manager.dart';
import 'package:campus_trade/presentation/resources/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarUpload extends StatelessWidget implements PreferredSizeWidget {
  final bool isvisible;
  AppBarUpload({required this.isvisible});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: ColorManager.SecondaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(42.r),
                bottomRight: Radius.circular(42.r))),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isvisible)
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.lightBlue,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: ColorManager.SecondaryColor,
                      ),
                    ),
                  )
                else
                  SizedBox(width: 32.w),
                Text(
                  "Upload",
                  style: TextStyles.White20Bold,
                ),
                SizedBox(
                  width: 32.w,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(147.h);
}
