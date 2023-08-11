import '../../../../Services/Model/payment_model.dart';

abstract class PinAuthEvent {}

class PinAuthStartVerification extends PinAuthEvent {
  final String pin;
  final PaymentModel paymentModel;
  PinAuthStartVerification(this.pin, this.paymentModel);
}
