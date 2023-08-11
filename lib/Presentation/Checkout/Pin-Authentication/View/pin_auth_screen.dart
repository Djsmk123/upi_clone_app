import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Payment-Result/bloc/payment_result_bloc.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Pin-Authentication/Bloc/pin_auth_bloc.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Pin-Authentication/widget/pin_screeen_widget.dart';
import 'package:upi_payment_ui/Routing/routing.gr.dart';
import 'package:upi_payment_ui/core/utils/theme/colors.dart';
import 'package:upi_payment_ui/core/utils/widgets/custom_snack_bar.dart';
import 'package:upi_payment_ui/core/utils/widgets/sized_box.dart';
import 'package:upi_payment_ui/gen/assets.gen.dart';

import '../../../../Services/Model/payment_model.dart';
import '../../../../core/utils/strings.dart';
import '../Bloc/pin_auth_event.dart';

@RoutePage(name: 'PinAuthPage')
class PinAuthenticationView extends StatefulWidget {
  final PaymentModel paymentModel;

  const PinAuthenticationView({super.key, required this.paymentModel});

  @override
  State<PinAuthenticationView> createState() => _PinAuthenticationViewState();
}

class _PinAuthenticationViewState extends State<PinAuthenticationView> {
  final int pinLength = 4; //default pin length is 4(can be changed later)
  bool hidePin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            widget.paymentModel.fromAccount.bankName,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
          elevation: 10,
          actions: [
            SizedBox(
              height: 60.h,
              width: 100.h,
              child: Assets.images.upiLogo.svg(),
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: Container(
              height: 60.h,
              width: 1.sw,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.paymentModel.toOwnerName,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp),
                  ),
                  Row(
                    children: [
                      Text(
                        "$currencySymbol ${widget.paymentModel.amount}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp),
                      ),
                      const SizeBoxCustom(
                        height: 0,
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                            size: 30.r,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
          backgroundColor: const Color(0XFFFAFAFA)),
      body: BlocConsumer<PinAuthBloc, PinAuthState>(
        listener: (context, state) {
          if (state is PinAuthVerifiying) {
            context.loaderOverlay.show();
          }
          if (state is PinAuthVerifiedFailed) {
            context.loaderOverlay.hide();
            showSnackBar(
                isSuccess: false,
                msg: "Something went wrong",
                context: context);
          }
          if (state is PinAuthMismatched) {
            context.loaderOverlay.hide();
            showSnackBar(
                isSuccess: false,
                msg: "Please enter correct pin",
                context: context);
          }
          if (state is PinAuthVerifiedSuccess) {
            context.loaderOverlay.hide();
            BlocProvider.of<PaymentResultBloc>(context)
                .add(PaymentTransactionStart(state.model));
            context.router.push(const PaymentResultPage());
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const SizeBoxCustom(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    ('Enter UPI pin').toUpperCase(),
                    style: TextStyle(
                      color: AppColors.kGrayColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      hidePin = !hidePin;
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Icon(
                            !hidePin ? Icons.visibility_off : Icons.visibility),
                        SizeBoxCustom(
                          height: 0,
                          width: 10.w,
                        ),
                        Text(
                          hidePin ? 'Show' : 'Hide',
                          style: TextStyle(
                            color: AppColors.kGrayColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: PinScreenWidget(
                  pinLength: pinLength,
                  autoSubmit: true, //auto-submit
                  onSubmit: (String value) {
                    BlocProvider.of<PinAuthBloc>(context).add(
                        PinAuthStartVerification(value, widget.paymentModel));
                  },
                  visible: hidePin,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
