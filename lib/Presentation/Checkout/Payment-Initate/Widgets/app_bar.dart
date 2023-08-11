import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upi_payment_ui/core/utils/theme/colors.dart';

class AppBarPaymentInitiate extends StatelessWidget {
  const AppBarPaymentInitiate({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: Icon(
            Icons.clear,
            size: 30.r,
            color: AppColors.kGrayColor,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              size: 30.r,
              color: AppColors.kGrayColor,
            ),
          ),
        )
      ],
    );
  }
}
