import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_manager.dart';
import '../../resources/text_styles.dart';

class Datatextfield extends StatelessWidget {
  String hinttext;
  TextEditingController Controller;

  Datatextfield({super.key, required this.hinttext, required this.Controller});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(top: 40, left: 20.r),
        child: Text(
          "$hinttext",
          style: TextStyles.black20Bold,
        ),
      ),
      Padding(
        padding:
            EdgeInsets.only(top: 8.r, right: 20.r, left: 20.r, bottom: 0.r),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "The field is required";
            }
            return null;
          },
          controller: Controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: ColorManager.greyColor),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: hinttext,
              contentPadding: EdgeInsets.all(10),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(8))),
        ),
      )
    ]);
  }
}
