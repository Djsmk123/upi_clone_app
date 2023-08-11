import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClearButton extends StatelessWidget {
  final Function()? onTap;
  const ClearButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.red.withOpacity(0.1)),
      child: MaterialButton(
          padding: const EdgeInsets.all(8),
          onPressed: onTap,
          height: 100.h,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          child: Icon(
            Icons.backspace_outlined,
            size: 24.r,
          )),
    );
  }
}
