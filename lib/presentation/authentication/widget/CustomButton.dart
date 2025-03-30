import 'package:campus_trade/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class CustomButtonnn extends StatelessWidget {
  final String name;
  final double width;
  final double height;
  final Color borderColor;
  final Widget? icon;
  final VoidCallback? onPressed;

  const CustomButtonnn({
    super.key,
    required this.name,
    this.onPressed,
    required this.width,
    required this.height,
    this.borderColor = ColorManager.SecondaryColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xff378BCB),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (icon != null) const SizedBox(width: 10),
              if (icon != null)
                icon is Icon
                    ? Icon(
                        (icon as Icon).icon,
                        color: ColorManager.PrimaryColor,
                      )
                    : icon!,
            ],
          ),
        ),
      ),
    );
  }
}
