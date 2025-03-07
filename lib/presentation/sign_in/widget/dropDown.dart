import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  Dropdown({super.key});
  final List<String> roles = [
    'Other',
    'SCALER',
    'Topics',
  ];

  String selectedRole = 'Other';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          value: selectedRole,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xff378BCB),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          items: roles.map((String role) {
            return DropdownMenuItem<String>(
              value: role,
              child: Text(role),
            );
          }).toList(),
          onChanged: (String? newValue) {
            selectedRole = newValue!;
          },
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.grey,
            size: 35,
          ),
        ),
      ],
    );
  }
}
