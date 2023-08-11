import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Pin-Authentication/widget/keyboard_widget.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Pin-Authentication/widget/pin_widget.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Pin-Authentication/widget/submit_button.dart';

import '../../../../core/utils/widgets/sized_box.dart';
import 'clear_button.dart';

class PinScreenWidget extends StatefulWidget {
  final int pinLength;
  final bool autoSubmit;
  final bool visible;
  final Function(String value) onSubmit;

  const PinScreenWidget(
      {Key? key,
      required this.pinLength,
      required this.onSubmit,
      required this.autoSubmit,
      required this.visible})
      : super(key: key);

  @override
  State<PinScreenWidget> createState() => _PinScreenWidgetState();
}

class _PinScreenWidgetState extends State<PinScreenWidget> {
  List<String> currentPin = [];
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    controllers =
        List.generate(widget.pinLength, (index) => TextEditingController());
    currentPin = List.generate(widget.pinLength, (index) => '');
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant PinScreenWidget oldWidget) {
    if (oldWidget.pinLength != widget.pinLength) {
      init();
    }
    super.didUpdateWidget(oldWidget);
  }

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0.r),
    borderSide: BorderSide.none,
  );
  int pinIndex = 0;
  bool isValid = false;
  onPinComplete() {
    String strPin = currentPin.join('');
    if (pinIndex == widget.pinLength) {
      widget.onSubmit(strPin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            alignment: const Alignment(0, 0.5),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                const SizeBoxCustom(
                  height: 50,
                ),
                buildPinRow(),
              ],
            ),
          ),
        ),
        buildDialPad(),
      ],
    );
  }

  Widget buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: controllers
          .map((e) => PinNumber(
                controller: e,
                outlineInputBorder: outlineInputBorder,
                isVisible: widget.visible,
              ))
          .toList(),
    );
  }

  Widget buildDialPad() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 32.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                3,
                (index) => KeyboardNumber(
                  n: index + 1,
                  onTap: () {
                    pinIndexSetup((index + 1).toString());
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                3,
                (index) => KeyboardNumber(
                  n: 4 + index,
                  onTap: () {
                    pinIndexSetup((index + 4).toString());
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                3,
                (index) => KeyboardNumber(
                  n: 7 + index,
                  onTap: () {
                    pinIndexSetup((index + 7).toString());
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Add a clear button to the dial pad
                ClearButton(
                  onTap: () {
                    clearPin();
                  },
                ),

                KeyboardNumber(
                  n: 0,
                  onTap: () {
                    pinIndexSetup(0.toString());
                  },
                ),
                SubmitButton(
                  onTap: onPinComplete,
                  isValid: isValid,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  pinIndexSetup(String text) {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < widget.pinLength) {
      pinIndex++;
    }
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;
    isValid = checkIsValidPin();
    setState(() {});
  }

  bool checkIsValidPin() {
    for (var element in controllers) {
      if (element.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  clearPin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else {
      setPin(pinIndex, '');
      currentPin[pinIndex - 1] = '';
      pinIndex--;
    }
    isValid = checkIsValidPin();
    setState(() {});
  }

  setPin(int n, String text) {
    controllers[n - 1].text = text;
  }
}
