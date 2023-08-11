part of 'pin_auth_bloc.dart';

@immutable
abstract class PinAuthState {}

class PinAuthInitial extends PinAuthState {}

class PinAuthVerifiedSuccess extends PinAuthState {
  final PaymentModel model;
  PinAuthVerifiedSuccess(this.model);
}

class PinAuthVerifiedFailed extends PinAuthState {}

class PinAuthVerifiying extends PinAuthState {}

class PinAuthMismatched extends PinAuthState {}
