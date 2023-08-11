part of 'payment_result_bloc.dart';

@immutable
abstract class PaymentResultState {}

class PaymentResultInitial extends PaymentResultState {}

class PaymentResultSuccess extends PaymentResultState {
  final PaymentResultModel result;

  PaymentResultSuccess(this.result);
}

class PaymentResultFailure extends PaymentResultState {}

class PaymentInProgress extends PaymentResultFailure {}
