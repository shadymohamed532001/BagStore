import 'package:bagstore/Core/themaing/app_image_assets.dart';
import 'package:bagstore/Core/Uitls/app_functions.dart';
import 'package:bagstore/Core/Uitls/local_services.dart';
import 'package:bagstore/Core/routes/routes.dart';
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
        pushAndFinsh(context, pageName: Routes.authViewRoute);
      }
    });
  }

  @override
  List<OnBordingModel> onBoardingPages() {
    return <OnBordingModel>[
      OnBordingModel(
        tittle: 'We are the ones who stand by your side in times of need',
        imagepath: ImagesAssetsManger.onBordingimage1,
        subtittle:
            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old ',
      ),
      OnBordingModel(
        tittle: 'Congratulations on the fastest trip you can find',
        imagepath: ImagesAssetsManger.onBordingimage2,
        subtittle:
            'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum ',
      ),
      OnBordingModel(
        tittle: 'LWith the click of a button you will find us',
        imagepath: ImagesAssetsManger.onBordingimage3,
        subtittle:
            'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised ',
      ),
    ];
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
