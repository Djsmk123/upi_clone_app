import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Payment-Result/bloc/payment_result_bloc.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Payment-Result/widgets/payment_failed_widget.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Payment-Result/widgets/payment_in_progress_widget.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Payment-Result/widgets/payment_sucess.dart';
import 'package:upi_payment_ui/core/utils/theme/colors.dart';

@RoutePage(name: 'PaymentResultPage')
class PaymentResultView extends StatefulWidget {
  const PaymentResultView({super.key});

  @override
  State<PaymentResultView> createState() => _PaymentResultViewState();
}

class _PaymentResultViewState extends State<PaymentResultView>
    with TickerProviderStateMixin {
  late AnimationController controller;
  Color backgroundColor = AppColors.kPrimaryColor;
  bool isSuccess = false;
  bool isFailed = false;
  bool animationCompleted = false;
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(vsync: this);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (isFailed) {
          backgroundColor = Colors.red;
        }
        if (isSuccess) {
          backgroundColor = Colors.green;
        }
        animationCompleted = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: BlocBuilder<PaymentResultBloc, PaymentResultState>(
          builder: (context, state) {
            if (state is PaymentInProgress) {
              return const PaymentInProgressWidget();
            }
            if (state is PaymentResultSuccess) {
              isSuccess = true;
              return PaymentSuccessWidget(
                onLoaded: (value) {
                  controller.duration = value?.duration;
                  controller.forward();
                },
                controller: controller,
                isAnimationCompleted: animationCompleted,
              );
            }
            if (state is PaymentResultFailure) {
              isFailed = true;
              return PaymentFailedWidget(
                controller: controller,
                onLoaded: (value) {
                  controller.duration = value?.duration;
                  controller.forward();
                },
                isAnimationCompleted: animationCompleted,
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
