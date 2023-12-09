// ignore_for_file: library_private_types_in_public_api

import 'package:bagstore/Core/themaing/app_colors.dart';
import 'package:bagstore/Core/themaing/app_image_assets.dart';
import 'package:bagstore/Feature/AuthView/login/presentation/views/login_view.dart';
import 'package:bagstore/Feature/AuthView/sign_up/presentation/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthViewBody extends StatefulWidget {
  static const String routeName = 'AuthViewBody';

  const AuthViewBody({super.key});

  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<AuthViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManger.whiteColor.withOpacity(0.2),
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Image.asset(
            ImagesAssetsManger.applogoBlack,
            width: 50.h,
            height: 50.h,
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TabBar(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                tabs: [
                  Text(
                    'SIGN IN',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14.sp),
                  ),
                  Text(
                    'SIGN UP',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14.sp),
                  ),
                ],
                indicatorWeight: 4,
                indicatorColor: ColorManger.primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    LoginView(),
                    SignUpView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
