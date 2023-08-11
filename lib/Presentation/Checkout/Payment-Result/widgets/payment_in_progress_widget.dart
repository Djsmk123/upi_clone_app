import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class PaymentInProgressWidget extends StatelessWidget {
  const PaymentInProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.lotties.paymentLoading.lottie();
  }
}
