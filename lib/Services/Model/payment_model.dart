import 'bank_account_model.dart';

class PaymentModel {
  final int orderId;
  final double amount;
  final String toUPiId;
  final String toOwnerName;
  final BackAccountModel fromAccount;

  const PaymentModel(
      {required this.orderId,
      required this.toOwnerName,
      required this.amount,
      required this.toUPiId,
      required this.fromAccount});
  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
        orderId: json['order_id'],
        amount: (json['amount'] as num).toDouble(),
        toUPiId: json['to_upi_id'],
        fromAccount: BackAccountModel.fromJson(json['from_account']),
        toOwnerName: json['to_owner_name']);
  }
  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'amount': amount,
      'to_upi_id': toUPiId,
      'from_account': fromAccount.toJson(),
      'to_owner_name': toOwnerName,
    };
  }
}
