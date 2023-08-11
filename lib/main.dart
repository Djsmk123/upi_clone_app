import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Payment-Initate/Bloc/payment_initiate_bloc.dart';
import 'package:upi_payment_ui/Presentation/Checkout/Payment-Result/bloc/payment_result_bloc.dart';
import 'package:upi_payment_ui/Routing/routing.dart';
import 'package:upi_payment_ui/core/utils/theme/colors.dart';

import 'Presentation/Checkout/Pin-Authentication/Bloc/pin_auth_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

//....................................APP Router  ................................
final appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(380, 720),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => PaymentInitiateBloc()),
            BlocProvider(create: (_) => PinAuthBloc()),
            BlocProvider(create: (_) => PaymentResultBloc())
          ],
          child: MaterialApp.router(
            title: 'Upi_payment_ui',
            builder: (context, child) {
              return LoaderOverlay(
                useDefaultLoading: false,
                overlayWidget: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                child: child ?? const Text("Loading ..."),
              );
            },
            debugShowCheckedModeBanner: false,
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            theme: ThemeData(useMaterial3: true),
          ),
        );
      },
    );
  }
}
//TO run Build runner
/* dart run build_runner watch --delete-conflicting-outputs*/
