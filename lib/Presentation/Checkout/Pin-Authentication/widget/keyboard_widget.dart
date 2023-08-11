import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeyboardNumber extends StatelessWidget {
  final int n;
  final Function()? onTap;
  const KeyboardNumber({
    Key? key,
    required this.n,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blueAccent.withOpacity(0.1),
      ),
      child: MaterialButton(
        padding: const EdgeInsets.all(8),
        onPressed: onTap,
        height: 100.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        child: Text(
          n.toString(),
          style: TextStyle(fontSize: 24.sp, color: Colors.black87),
        ),
      ),
    );
  }
}
