import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/text_styles.dart';

class CategoryButton extends StatefulWidget {
  CategoryButton({super.key, required this.onCategorySelected});
  Function(String)? onCategorySelected;
  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

List<String> categories = [
  "Engineering",
  "Medicine",
  "Veterinary",
  "Agriculture",
  "Dentistry",
  "Pharmacy",
];
String? SelectedCategory;

class _CategoryButtonState extends State<CategoryButton> {
  @override
  @override
  void initState() {
    super.initState();
    SelectedCategory = null;
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h, left: 20.w),
          child: Text(
            "Category",
            style: TextStyles.black20Bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 2.w, color: ColorManager.greyColor),
                borderRadius: BorderRadius.circular(8.r),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.w),
                borderRadius: BorderRadius.circular(8.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.w, color: Colors.red),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            value: SelectedCategory,
            items: categories.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (String? value) {
              if (value != null) {
                widget.onCategorySelected!(value);
              }
              // setState(() {
              //   selectedCategory = value!;
              // });
            },
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 30,
            dropdownColor: Colors.white,
            style: const TextStyle(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
            isExpanded: true,
            hint: const Text("Select Category"),
          ),
        ),
      ],
    );
  }
}
