import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Payment-Initate/Bloc/payment_initiate_bloc.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Payment-Initate/Widgets/app_bar.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Payment-Initate/Widgets/payment_button_sheet.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Payment-Initate/Widgets/payment_text_field.dart';
import 'package:upi_payment_ui/Routing/routing.gr.dart';
import 'package:upi_payment_ui/core/utils/theme/colors.dart';
import 'package:upi_payment_ui/core/utils/widgets/custom_snack_bar.dart';
import 'package:upi_payment_ui/gen/assets.gen.dart';

import '../../../../core/utils/widgets/sized_box.dart';
import '../Bloc/payment_initiate_state.dart';

@RoutePage(name: 'PaymentInitiatePage')
class PaymentInitiate extends StatefulWidget {
  const PaymentInitiate({super.key});

  @override
  State<PaymentInitiate> createState() => _PaymentInitiateState();
}

class _PaymentInitiateState extends State<PaymentInitiate> {
  //dummy data
  final toUPiID = "smkwinner@upi";
  final toOwnerName = "Smkwinner Pvt ltd";
  double amount = 0.0;
  final accountNumber = "1512151255623562323";
  final backAccountName = "Axis Bank";
  final fromUpiId = "966670419*4@upi";

  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: const AppBarPaymentInitiate(),
        ),
        body: BlocConsumer<PaymentInitiateBloc, PaymentInitiateState>(
          listener: (context, state) {
            if (state is PaymentInitiateFailure) {
              showSnackBar(
                  isSuccess: false,
                  msg: 'Something went wrong',
                  context: context);
              context.loaderOverlay.hide();
            }
            if (state is PaymentInitiateSuccess) {
              context.loaderOverlay.hide();
              context.router
                  .push(PinAuthPage(paymentModel: state.paymentModel));
            }
            if (state is PaymentInitiateLoading) {
              context.loaderOverlay.show();
            }
          },
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue.shade500),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: Assets.images.avatar.provider(),
                            fit: BoxFit.cover)),
                  ),
                  const SizeBoxCustom(),
                  Text(
                    "Paying to $toOwnerName",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizeBoxCustom(),
                  Text(
                    toUPiID,
                    style: TextStyle(
                        color: AppColors.kGrayColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizeBoxCustom(
                    height: 20,
                  ),
                  PaymentAmountTextField(
                    controller: amountController,
                    onChange: (value) {
                      String onlyDigits =
                          value!.replaceAll(RegExp('[^0-9]'), "");
                      double doubleValue = double.parse(onlyDigits) / 100;
                      amount = doubleValue;
                      setState(() {});
                    },
                  ),
                  if (!isValid())
                    Container(
                      height: 45.h,
                      width: 0.6.sw,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(32.r)),
                      child: const Text(
                        "Amount should be greater than zero",
                        textAlign: TextAlign.center,
                      ),
                    )
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: PaymentButtonSheet(
          backAccountName: backAccountName,
          fromUpiId: fromUpiId,
          amount: amount,
          onTap: () {
            if (isValid()) {
              BlocProvider.of<PaymentInitiateBloc>(context).add(
                  PaymentInitiateStart(
                      toOwnerName: toOwnerName,
                      fromUpiId: fromUpiId,
                      toUpiId: toUPiID,
                      fromAccountNumber: accountNumber,
                      fromAccountName: "Md Mobin",
                      fromAccountBankName: backAccountName,
                      amount: amount));
            }
          },
          bankAccountNumber: accountNumber,
          isValid: isValid(),
        ));
  }

  bool isValid() {
    return amount > 0;
  }
}
