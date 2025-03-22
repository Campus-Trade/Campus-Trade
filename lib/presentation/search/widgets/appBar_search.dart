import 'package:campus_trade/presentation/notification/notification_screen.dart';
import 'package:campus_trade/presentation/resources/color_manager.dart';
import 'package:campus_trade/presentation/resources/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarSearch extends StatelessWidget implements PreferredSizeWidget {
  const AppbarSearch({super.key});

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
            onTap: () {},
            child: Image.asset(
              ImageManager.backButton,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintText: "Search Here",
                suffixIcon: const Icon(Icons.sync_alt),
                fillColor: ColorManager.PrimaryColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const NotificationScreen();
              }));
            },
            icon: const Icon(
              Icons.notifications,
              color: ColorManager.PrimaryColor,
              size: 30,
            ),
          ),
          SizedBox(width: 10.w),
          InkWell(
            child: Image.asset(ImageManager.cartButton),
          )
        ],
      ),
    );
  }
}
