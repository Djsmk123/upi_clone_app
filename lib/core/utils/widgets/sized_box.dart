import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeBoxCustom extends StatelessWidget {
  final double height;
  final double width;
  const SizeBoxCustom({super.key, this.height = 10, this.width = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h, width: width.w);
  }
}
