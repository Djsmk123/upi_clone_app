import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Payment-Initate/Bloc/payment_initiate_state.dart';
import 'package:upi_payment_ui/Services/Repository/payment_repo.dart';

part 'payment_initiate_event.dart';

class PaymentInitiateBloc
    extends Bloc<PaymentInitiateEvent, PaymentInitiateState> {
  PaymentInitiateBloc() : super(PaymentInitiateInitial()) {
    on<PaymentInitiateEvent>((event, emit) async {
      if (event is PaymentInitiateStart) {
        try {
          emit(PaymentInitiateLoading());
          final res = await PaymentRepo.getTransactionInfo(
              fromUpiId: event.fromUpiId,
              toOwnerName: event.toOwnerName,
              toUpiId: event.toUpiId,
              fromAccountNumber: event.fromAccountNumber,
              fromAccountName: event.fromAccountName,
              fromAccountBankName: event.fromAccountBankName,
              amount: event.amount);
          if (res != null) {
            emit(PaymentInitiateSuccess(res));
          }
        } catch (e) {
          log(e.toString());
          emit(PaymentInitiateFailure());
        }
      }
    });
  }
}
