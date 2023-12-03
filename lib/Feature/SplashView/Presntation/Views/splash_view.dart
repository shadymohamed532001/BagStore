import 'package:bagstore/Core/Uitls/app_colors.dart';
import 'package:bagstore/Feature/SplashView/Presntation/Views/Widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.darkprimaryColor,
      body: const SplashViewBody(),
    );
  }
}
