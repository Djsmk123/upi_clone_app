import 'package:flutter/cupertino.dart';
import 'package:upi_payment_ui/Services/Model/payment_model.dart';

@immutable
abstract class PaymentInitiateState {}

class PaymentInitiateInitial extends PaymentInitiateState {}

class PaymentInitiateSuccess extends PaymentInitiateState {
  final PaymentModel paymentModel;

  PaymentInitiateSuccess(this.paymentModel);
}

class PaymentInitiateFailure extends PaymentInitiateState {}

class PaymentInitiateLoading extends PaymentInitiateState {}
