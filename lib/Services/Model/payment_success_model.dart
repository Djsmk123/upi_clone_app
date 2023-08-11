import 'package:upi_payment_ui/Services/Model/payment_model.dart';

class PaymentResultModel {
  final String transactionId;
  final bool status;
  final PaymentModel paymentInfo;
  final String createdAt;
  final String updatedAt;

  PaymentResultModel({
    required this.transactionId,
    required this.status,
    required this.paymentInfo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentResultModel.fromJson(Map<String, dynamic> json) {
    return PaymentResultModel(
      transactionId: json['transcation_id'],
      status: json['status'],
      paymentInfo: PaymentModel.fromJson(json['payment_info']),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transaction_id': transactionId,
      'status': status,
      'payment_info': paymentInfo.toJson(),
      'created_at': createdAt,
      'updated_at': updatedAt
    };
  }
}
