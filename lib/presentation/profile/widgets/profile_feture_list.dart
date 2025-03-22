import 'package:campus_trade/presentation/profile/profile_data_model.dart';
import 'package:campus_trade/presentation/profile/widgets/profile_feture.dart';
import 'package:flutter/material.dart';

class ProfileFetureList extends StatelessWidget {
  ProfileFetureList({super.key});
  final List<ProfileDataModel> profileData = [
    ProfileDataModel(icon: Icons.upcoming_rounded, title: 'Pending Uploads'),
    ProfileDataModel(icon: Icons.history, title: 'Order History'),
    ProfileDataModel(icon: Icons.info_rounded, title: 'Info'),
    ProfileDataModel(icon: Icons.settings, title: 'Settings'),
    ProfileDataModel(icon: Icons.logout, title: 'Log out'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: profileData.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ProfileFeture(
          profileDataModel: profileData[index],
        );
      },
    );
  }
}
