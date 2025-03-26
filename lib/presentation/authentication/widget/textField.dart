import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.width,
    this.height,
    required this.keyboardType,
  });

  final String? hintText;
  final bool isPassword;
  final double? width;
  final double? height;
  final TextInputType? keyboardType;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  String _errorMessage(String? hintText) {
    switch (hintText) {
      case 'Mobile number or email.':
        return 'Mobile number or email is empty';
      case 'Password':
        return 'Password is empty';
      case 'First Name':
        return 'First Name is empty';
      case 'Last Name':
        return 'Last Name is empty';
      case 'Mobile number':
        return 'Mobile number is empty';
      case 'Email':
        return 'Email is empty';
      case 'Confirm Password':
        return 'Confirm Password is empty';
      case 'University':
        return 'University is empty';
      default:
        return 'Field is empty';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return _errorMessage(widget.hintText);
          }
          return null;
        },
        obscureText: widget.isPassword ? _obscureText : false,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
