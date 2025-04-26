import 'package:campus_trade/presentation/notification/notification_screen.dart';
import 'package:campus_trade/presentation/resources/color_manager.dart';
import 'package:campus_trade/presentation/resources/image_manager.dart';
import 'package:campus_trade/presentation/resources/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Cubit/user_personal_data_cubit/user_cubit.dart';

class AppbarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppbarHome({super.key});

  @override
  Size get preferredSize => Size.fromHeight(140.h);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UserError) {
          return Center(child: Text(state.message));
        }
        if (state is UserLoaded) {
          final user = state.user;
          return Container(
            height: preferredSize.height,
            decoration: const BoxDecoration(
              color: ColorManager.SecondaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 45,
            ),
            child: Center(
              child: ListTile(
                title: Text(
                  'Hi ${user.firstName}',
                  style: TextStyles.white24Bold,
                ),
                subtitle: Text(
                  'Are you ready to shop?',
                  style: TextStyles.white14Bold,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const NotificationScreen();
                          }),
                        );
                      },
                      icon: const Icon(
                        Icons.notifications,
                        size: 30,
                        color: ColorManager.PrimaryColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        ImageManager.cartButton,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    CircleAvatar(
                      radius: 21.r,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.network(
                          user.image,
                          width: 42.w,
                          height: 42.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }

        // ✅ حل المشكلة هنا
        return const SizedBox();
      },
    );
  }
}
