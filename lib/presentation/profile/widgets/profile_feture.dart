import 'package:campus_trade/presentation/profile/profile_data_model.dart';
import 'package:campus_trade/presentation/resources/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileFeture extends StatelessWidget {
  const ProfileFeture({super.key, required this.profileDataModel});
  final ProfileDataModel profileDataModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
      child: Row(
        children: [
          Icon(
            profileDataModel.icon,
            size: 35,
          ),
          const Spacer(),
          Text(
            profileDataModel.title,
            style: TextStyles.black16Regular.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
          )
        ],
      ),
    );
  }
}
