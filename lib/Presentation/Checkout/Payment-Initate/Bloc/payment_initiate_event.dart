part of 'payment_initiate_bloc.dart';

@immutable
abstract class PaymentInitiateEvent {}

class PaymentInitiateStart extends PaymentInitiateEvent {
  final String fromUpiId;
  final String toOwnerName;
  final String toUpiId;
  final String fromAccountNumber;
  final String fromAccountName;
  final String fromAccountBankName;
  final double amount;

  PaymentInitiateStart(
      {required this.toOwnerName,
      required this.fromUpiId,
      required this.toUpiId,
      required this.fromAccountNumber,
      required this.fromAccountName,
      required this.fromAccountBankName,
      required this.amount});
}
