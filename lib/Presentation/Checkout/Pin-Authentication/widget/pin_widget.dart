import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinNumber extends StatelessWidget {
  final TextEditingController controller;
  final OutlineInputBorder outlineInputBorder;
  final bool isVisible;
  const PinNumber({
    Key? key,
    required this.controller,
    required this.outlineInputBorder,
    required this.isVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      child: TextField(
        controller: controller,
        enabled: false,
        obscureText: isVisible,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: outlineInputBorder,
          contentPadding: const EdgeInsets.all(16),
          filled: true,
          fillColor: Colors.grey.shade300,
        ),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}
