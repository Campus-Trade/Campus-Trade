import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/image_manager.dart';
import '../../../../core/utils/resources/text_styles.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      decoration: BoxDecoration(
        color: ColorManager.lightBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            ImageManager.rectangleT,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'Mohab Mohamed',
              style: TextStyles.white14regulare,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'Ati T580A - KT800R Plastic T Ruler, 80 cm Length',
              style: TextStyles.white14Bold.copyWith(
                color: ColorManager.blackColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 15,
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      width: 1.5,
                      color: ColorManager.blackColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Mansoura',
                          style: TextStyles.black16Regular,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Icon(
                          Icons.location_pin,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  '550 EGP',
                  style: TextStyles.black16Regular.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
