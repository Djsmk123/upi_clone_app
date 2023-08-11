import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:upi_payment_ui/Routing/routing.gr.dart';

import '../../../../gen/assets.gen.dart';

class PaymentFailedWidget extends StatelessWidget {
  final AnimationController controller;
  final Function(LottieComposition? composition)? onLoaded;
  final bool isAnimationCompleted;
  const PaymentFailedWidget(
      {super.key,
      required this.controller,
      this.onLoaded,
      required this.isAnimationCompleted});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 400,
          child: Assets.lotties.paymentFailed.lottie(
              controller: controller, repeat: false, onLoaded: onLoaded),
        ),
        if (isAnimationCompleted)
          Bounceable(
              onTap: () => onTap(context),
              child: SizedBox(
                width: 150.w,
                height: 40.h,
                child: MaterialButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  onPressed: () => onTap(context),
                  child: Center(
                    child: Text(
                      'Try again',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    ),
                  ),
                ),
              ))
      ],
    );
  }

  void onTap(BuildContext context) {
    context.router.pushAndPopUntil(const PaymentInitiatePage(),
        predicate: (route) => false);
  }
}
