// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../../core/utils/resources/icon_manager.dart';

// class FilterDataButton extends StatefulWidget {
//   Function(String)? onCategoryChanged;
//   FilterDataButton({super.key, required this.onCategoryChanged});

//   @override
//   State<FilterDataButton> createState() => _FilterDataButtonState();
// }

// class _FilterDataButtonState extends State<FilterDataButton> {
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: categories.first,
//       items: categories.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(value: value, child: Text(value));
//       }).toList(),
//       onChanged: (String? value) {
//         if (value != null) {
//           widget.onCategoryChanged!(value);
//         }
//       },
//       icon: SvgPicture.asset(IconManager.filter),
//       dropdownColor: Colors.white,
//     );
//   }
// }
