import 'package:bagstore/Core/Uitls/clip_shapes.dart';
import 'package:bagstore/Core/Uitls/app_constants.dart';
import 'package:bagstore/Core/themaing/app_image_assets.dart';
import 'package:bagstore/Core/helper/app_functions.dart';
import 'package:bagstore/Core/Uitls/widgets/custom_clip_path.dart';
import 'package:bagstore/Core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    tweenanimation();
    _navigateToHome();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _setSystemUIOverlayStyle();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomClipPath(
          clipHight: MediaQuery.of(context).size.height / 1,
          clipWidth: double.infinity,
          clipper: Container1Clipper(),
        ),
        CustomClipPath(
          clipHight: MediaQuery.of(context).size.height / 1,
          clipWidth: double.infinity,
          clipper: Container2Clipper(),
        ),
        AnimatedBuilder(
            animation: animation,
            builder: (context, _) {
              return FadeTransition(
                opacity: animation,
                child: Center(
                    child: Image.asset(
                  ImagesAssetsManger.splashLogo,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 6,
                )),
              );
            })
      ],
    );
  }

// make the wifi and power icons disappear when the device start with spash screen
  void _setSystemUIOverlayStyle() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    final double bottomPadding = View.of(context).viewPadding.bottom;

    // Set the color based on the presence of the system navigation bar
    final Color? systemNavigationBarColor =
        bottomPadding > 0 ? null : Colors.transparent;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: systemNavigationBarColor,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 2), (() {
      if (onBording != null) {
        if (token != null) {
          // pushAndFinsh(context, pageName: Routes.homeViewRoute);
        } else {
          pushAndFinsh(context, pageName: Routes.authViewRoute);
        }
      } else {
        pushAndFinsh(context, pageName: Routes.onBoardingViewRoute);
      }
    }));
  }

  void tweenanimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    animation = Tween<double>(begin: 0, end: 1.8).animate(animationController);
    animationController.forward();
  }
}
