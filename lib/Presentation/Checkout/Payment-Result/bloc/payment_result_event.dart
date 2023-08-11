part of 'payment_result_bloc.dart';

@immutable
abstract class PaymentResultEvent {}

class PaymentTransactionStart extends PaymentResultEvent {
  final PaymentModel paymentModel;

  PaymentTransactionStart(this.paymentModel);
}
