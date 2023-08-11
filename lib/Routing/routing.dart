import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:upi_payment_ui/Routing/routing.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ); //.cupertino, .adaptive ..etc

  @override
  final List<AutoRoute> routes = <CustomRoute>[
    CustomRoute(
      path: '/',
      initial: true,
      page: PaymentInitiatePage.page,
    ),
    CustomRoute(
        path: '/payment_result',
        page: PaymentResultPage.page,
        durationInMilliseconds: 600,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return RotationTransition(
            turns: animation,
            child: child,
          );
        }),
    CustomRoute(
      path: '/pin_auth',
      page: PinAuthPage.page,
    ),
  ];
}
