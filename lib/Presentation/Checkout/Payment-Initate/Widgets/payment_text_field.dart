import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/strings.dart';
import '../../../../core/utils/theme/colors.dart';

class PaymentAmountTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String? value)? onChange;
  final String? Function(String? value)? onValidator;

  const PaymentAmountTextField(
      {super.key, required this.controller, this.onChange, this.onValidator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFormField(
        textAlign: TextAlign.center,
        maxLines: 1,
        validator: onValidator,
        decoration: InputDecoration(
            hintText: "$currencySymbol 0.0",
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            hintStyle: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.kGrayColor)),
        style: TextStyle(
            fontSize: 40.sp, fontWeight: FontWeight.bold, color: Colors.black),
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          CurrencyTextInputFormatter(
              enableNegative: true,
              locale: "hi",
              decimalDigits: 1,
              symbol: currencySymbol),
        ],
        onChanged: onChange,
      ),
    );
  }
}
