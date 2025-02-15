import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final Widget? icon;

  const Item({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 250, 233, 221),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xffcba5a0),
          width: 2,
        ),
      ),
      width: 90,
      height: 60,
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: icon,
        ),
      ),
    );
  }
}
