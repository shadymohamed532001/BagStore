import 'package:bagstore/Core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgaStore extends StatelessWidget {
  const BgaStore({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        onGenerateRoute: AppRoutes.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
