import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Pin-Authentication/Bloc/pin_auth_event.dart';
import 'package:upi_payment_ui/Services/Repository/payment_repo.dart';

import '../../../../Services/Model/payment_model.dart';

part 'pin_auth_state.dart';

class PinAuthBloc extends Bloc<PinAuthEvent, PinAuthState> {
  PinAuthBloc() : super(PinAuthInitial()) {
    on<PinAuthEvent>((event, emit) async {
      if (event is PinAuthStartVerification) {
        try {
          emit(PinAuthVerifiying());
          final res = await PaymentRepo.verifyPin(event.pin);
          if (res) {
            emit(PinAuthVerifiedSuccess(event.paymentModel));
          } else {
            emit(PinAuthMismatched());
          }
        } catch (e) {
          log(e.toString());
          emit(PinAuthVerifiedFailed());
        }
      }
    });
  }
}
