import 'package:campus_trade/presentation/resources/color_manager.dart';
import 'package:campus_trade/presentation/resources/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Cubit/user_personal_data_cubit/user_cubit.dart';

class AppbarNotifications extends StatelessWidget
    implements PreferredSizeWidget {
  const AppbarNotifications({super.key});

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
                SizedBox(width: 16.w),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: user.image.startsWith('assets/')
                        ? Image.asset(
                            user.image,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            user.image,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.network(user.image, fit: BoxFit.cover),
                          ),
                  ),
                )
              ],
            ),
          );
        }

        return const SizedBox(); // في حالة غير متوقعة
      },
    );
  }
}
