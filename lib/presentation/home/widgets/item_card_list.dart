import 'package:campus_trade/presentation/home/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCardList extends StatelessWidget {
  const ItemCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const ItemCard();
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 16.w,
            );
          },
          itemCount: 10),
    );
  }
}
