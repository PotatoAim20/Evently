import 'package:evently/extenstions/build_context_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Icon icon;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon.icon, color: Color(0xff7B7B7B), size: 24),
        hint: Text(
          hintText,
          style: context.labelSmall?.copyWith(color: Color(0xff7B7B7B)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff7B7B7B)),
          borderRadius: BorderRadius.circular(16.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff7B7B7B)),
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff7B7B7B)),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
