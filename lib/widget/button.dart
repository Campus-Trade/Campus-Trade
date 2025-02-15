import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xff1E4174),
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
