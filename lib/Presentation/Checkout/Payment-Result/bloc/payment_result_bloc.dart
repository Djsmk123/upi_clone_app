import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upi_payment_ui/Services/Model/payment_model.dart';
import 'package:upi_payment_ui/Services/Repository/payment_repo.dart';

import '../../../../Services/Model/payment_success_model.dart';

part 'payment_result_event.dart';
part 'payment_result_state.dart';

class PaymentResultBloc extends Bloc<PaymentResultEvent, PaymentResultState> {
  PaymentResultBloc() : super(PaymentResultInitial()) {
    on<PaymentResultEvent>((event, emit) async {
      if (event is PaymentTransactionStart) {
        emit(PaymentInProgress());
        final res = await PaymentRepo.getResult(event.paymentModel);
        if (res != null && res.status == true) {
          emit(PaymentResultSuccess(res));
        } else {
          emit(PaymentResultFailure());
        }
      }
    });
  }
}
