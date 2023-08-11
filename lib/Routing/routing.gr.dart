// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:upi_payment_ui/Presentation/Checkout/Payment-Initate/View/payment_initiate_screen.dart'
    as _i1;
import 'package:upi_payment_ui/Presentation/Checkout/Payment-Result/View/payment_result_screen.dart'
    as _i2;
import 'package:upi_payment_ui/Presentation/Checkout/Pin-Authentication/View/pin_auth_screen.dart'
    as _i3;
import 'package:upi_payment_ui/Services/Model/payment_model.dart' as _i6;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    PaymentInitiatePage.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PaymentInitiate(),
      );
    },
    PaymentResultPage.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PaymentResultView(),
      );
    },
    PinAuthPage.name: (routeData) {
      final args = routeData.argsAs<PinAuthPageArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.PinAuthenticationView(
          key: args.key,
          paymentModel: args.paymentModel,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.PaymentInitiate]
class PaymentInitiatePage extends _i4.PageRouteInfo<void> {
  const PaymentInitiatePage({List<_i4.PageRouteInfo>? children})
      : super(
          PaymentInitiatePage.name,
          initialChildren: children,
        );

  static const String name = 'PaymentInitiatePage';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PaymentResultView]
class PaymentResultPage extends _i4.PageRouteInfo<void> {
  const PaymentResultPage({List<_i4.PageRouteInfo>? children})
      : super(
          PaymentResultPage.name,
          initialChildren: children,
        );

  static const String name = 'PaymentResultPage';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PinAuthenticationView]
class PinAuthPage extends _i4.PageRouteInfo<PinAuthPageArgs> {
  PinAuthPage({
    _i5.Key? key,
    required _i6.PaymentModel paymentModel,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          PinAuthPage.name,
          args: PinAuthPageArgs(
            key: key,
            paymentModel: paymentModel,
          ),
          initialChildren: children,
        );

  static const String name = 'PinAuthPage';

  static const _i4.PageInfo<PinAuthPageArgs> page =
      _i4.PageInfo<PinAuthPageArgs>(name);
}

class PinAuthPageArgs {
  const PinAuthPageArgs({
    this.key,
    required this.paymentModel,
  });

  final _i5.Key? key;

  final _i6.PaymentModel paymentModel;

  @override
  String toString() {
    return 'PinAuthPageArgs{key: $key, paymentModel: $paymentModel}';
  }
}
