import 'package:bagstore/Core/Uitls/functions.dart';
import 'package:bagstore/Core/Uitls/local_services.dart';
import 'package:bagstore/Core/config/routes/routes.dart';
import 'package:bagstore/Feature/OnBordingView/Presentation/Views/Widgets/list_of_onbording_continet.dart';
import 'package:bagstore/Feature/OnBordingView/data/models/on_bording_model.dart';
import 'package:bagstore/Feature/OnBordingView/data/repositories/onbording_repo.dart';
import 'package:flutter/material.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  @override
  void navigateToAuth({required BuildContext context}) {
    LocalServices.saveData(
      key: 'onbording',
      value: true,
    ).then((value) {
      if (value) {
        pushAndFinsh(context, pageName: Routes.AuthViewRoute);
      }
    });
  }

  @override
  List<OnBordingModel> onBoardingPages() {
    return continte;
  }

  @override
  void navigateBetweenPages(
      {required BuildContext context,
      required PageController pageController,
      required bool isLastBoarding}) {
    if (isLastBoarding) {
      navigateToAuth(context: context);
    } else {
      pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    }
  }
}
