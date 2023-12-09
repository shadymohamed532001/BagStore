import 'package:bagstore/Core/themaing/app_colors.dart';

import 'package:bagstore/Core/helper/service_locator.dart';
import 'package:bagstore/Core/routes/routes.dart';
import 'package:bagstore/Feature/AuthView/auth_view_body.dart';
import 'package:bagstore/Feature/AuthView/login/presentation/manger/cubit/login_cubit.dart';
import 'package:bagstore/Feature/AuthView/sign_up/presentation/manger/register_cubit.dart';
import 'package:bagstore/Feature/OnBordingView/Presentation/Views/manger/cubit/onbording_cubit.dart';
import 'package:bagstore/Feature/OnBordingView/Presentation/Views/onbodrding_view.dart';
import 'package:bagstore/Feature/SplashView/Presntation/Views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case Routes.onBoardingViewRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => serviceLocator.get<OnbordingCubit>(),
                  child: const OnBordingView(),
                ));

      case Routes.authViewRoute:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider(
                    create: (context) => serviceLocator.get<LoginCubit>(),
                  ),
                  BlocProvider(
                    create: (context) => RegisterCubit(),
                  ),
                ], child: const AuthViewBody()));
      // case Routes.homeViewRoute:
      //   return MaterialPageRoute(builder: (context) => const HomeView());

      default:
        return _unFoundRoute();
    }
  }

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text('noRouteFounded',
              style: TextStyle(
                fontSize: 28,
                color: ColorManger.blackColor,
              )),
        ),
      ),
    );
  }
}
