import 'package:bagstore/Core/Uitls/Resourses/ColorMangager.dart';
import 'package:bagstore/Core/Uitls/Resourses/style_manger.dart';
import 'package:bagstore/Core/Uitls/Resourses/StringManger.dart';
import 'package:bagstore/Core/Uitls/Resourses/ValuesManger.dart';
import 'package:bagstore/Core/Uitls/service_locator.dart';
import 'package:bagstore/Core/config/routes/routes.dart';
import 'package:bagstore/Feature/AuthView/Presentation/Views/auth_view_body.dart';
import 'package:bagstore/Feature/Home/presentation/View/home_view.dart';
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
        return MaterialPageRoute(builder: (context) => AuthViewBody());
      case Routes.homeViewRoute:
        return MaterialPageRoute(builder: (context) => const HomeView());

      default:
        return _unFoundRoute();
    }
  }

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(AppString.noRouteFounded,
              style: getBoldStyle(
                fontsize: AppSize.s28,
                color: ColorManger.blackColor,
              )),
        ),
      ),
    );
  }
}
