import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upi_payment_ui/core/utils/extenstion.dart';
import 'package:upi_payment_ui/core/utils/strings.dart';
import 'package:upi_payment_ui/core/utils/theme/colors.dart';

import '../../../../core/utils/widgets/sized_box.dart';
import '../../../../gen/assets.gen.dart';

class PaymentButtonSheet extends StatelessWidget {
  final String backAccountName;
  final String bankAccountNumber;
  final String fromUpiId;
  final double amount;
  final bool isValid;
  final Function()? onTap;

  const PaymentButtonSheet(
      {super.key,
      required this.backAccountName,
      required this.fromUpiId,
      required this.amount,
      required this.bankAccountNumber,
      required this.isValid,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Card(
        elevation: 10,
        surfaceTintColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizeBoxCustom(
                height: 15,
              ),
              Text(
                ('Choose account or card to pay with').toUpperCase(),
                style: TextStyle(
                    color: AppColors.kGrayColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
              ),
              const SizeBoxCustom(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.w,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: Assets.images.bankLogo.image(),
                        ),
                      ),
                      const SizeBoxCustom(
                        height: 0,
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$backAccountName ${bankAccountNumber.maskAccountNumber()}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizeBoxCustom(
                            height: 2,
                          ),
                          Text(
                            fromUpiId,
                            style: TextStyle(
                              color: AppColors.kGrayColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 30.sp,
                        color: AppColors.kGrayColor,
                      ))
                ],
              ),
              const SizeBoxCustom(
                height: 20,
              ),
              Center(
                child: Bounceable(
                    onTap: onTap,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      height: 50.h,
                      width: 0.8.sw,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color:
                              isValid ? AppColors.kPrimaryColor : Colors.grey,
                          borderRadius: BorderRadius.circular(32.r)),
                      child: Text(
                        "Pay $currencySymbol $amount",
                        style: const TextStyle(color: Colors.white),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
