import 'dart:developer' as l;
import 'dart:math';

import '../../core/utils/strings.dart';
import '../Model/bank_account_model.dart';
import '../Model/payment_model.dart';
import '../Model/payment_success_model.dart';

class PaymentRepo {
  static Future<PaymentModel?> getTransactionInfo({
    required String fromUpiId,
    required String toOwnerName,
    required String toUpiId,
    required String fromAccountNumber,
    required String fromAccountName,
    required String fromAccountBankName,
    required double amount,
  }) async {
    try {
      int orderId = Random().nextInt(48454);
      await Future.delayed(const Duration(seconds: 3));
      PaymentModel paymentModel = PaymentModel(
          orderId: orderId,
          toOwnerName: toOwnerName,
          amount: amount,
          toUPiId: toUpiId,
          fromAccount: BackAccountModel(
            upiId: fromUpiId,
            accountNumber: fromAccountNumber,
            bankName: fromAccountBankName,
          ));
      return paymentModel;
    } catch (e) {
      l.log(e.toString());
    }
    return null;
  }

  static Future<bool> verifyPin(String pin) async {
    if (pin.length == 4) {
      return pinOfLength4 == pin;
    }
    return pinOfLength6 == pin;
  }

  static Future<PaymentResultModel?> getResult(PaymentModel model) async {
    await Future.delayed(const Duration(seconds: 5));
    final time = DateTime.now().toIso8601String();
    return PaymentResultModel(
        transactionId: Random().nextInt(123213).toString(),
        status: true,
        paymentInfo: model,
        createdAt: time,
        updatedAt: time);
  }
}
