import 'package:flutter/material.dart';

import '../../../../core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/image_manager.dart';
import '../../../../core/utils/resources/text_styles.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(
          ImageManager.ellipse,
        ),
      ),
      title: Text(
        'Mohab Mohamed',
        style: TextStyles.black16Regular,
      ),
      subtitle: Text(
        'Borem ipsum dolor sit amet, consectetur adipiscing elit Borem ipsum dolor sit amet, consectetur adipiscing elit.',
        style: TextStyles.white14regulare.copyWith(
          overflow: TextOverflow.ellipsis,
          color: ColorManager.blackColor,
        ),
      ),
      trailing: const Text('12:15'),
    );
  }
}
