import 'package:campus_trade/presentation/profile/widgets/profile_feture_list.dart';
import 'package:campus_trade/presentation/profile/widgets/profile_image.dart';
import 'package:campus_trade/presentation/resources/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const ProfileImage(),
            Text(
              'Mohab Mohamed',
              style: TextStyles.black20Bold,
            ),
            ProfileFetureList(),
          ],
        ),
      ),
    );
  }
}
