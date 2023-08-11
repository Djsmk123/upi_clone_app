import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitButton extends StatelessWidget {
  final bool isValid;
  final Function()? onTap;
  const SubmitButton({
    Key? key,
    required this.onTap,
    required this.isValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 70.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: !isValid ? Colors.grey : Colors.green),
      child: MaterialButton(
          padding: const EdgeInsets.all(8),
          onPressed: onTap,
          height: 100.h,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          child: Icon(
            Icons.done,
            color: isValid ? Colors.white : Colors.black,
            size: 35.r,
          )),
    );
  }
}
