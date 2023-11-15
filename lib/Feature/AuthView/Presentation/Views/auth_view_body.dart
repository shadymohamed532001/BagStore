// ignore_for_file: library_private_types_in_public_api

import 'package:bagstore/Core/Uitls/Resourses/ColorMangager.dart';
import 'package:bagstore/Core/Uitls/Resourses/ImageAssets.dart';
import 'package:bagstore/Feature/AuthView/login/presentation/manger/cubit/login_cubit.dart';
import 'package:bagstore/Feature/AuthView/login/presentation/widgets/login_view_body.dart';
import 'package:bagstore/Feature/AuthView/sign_up/presentation/manger/register_cubit.dart';
import 'package:bagstore/Feature/AuthView/sign_up/presentation/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Image.asset(
              ImagesAssetsManger.applogoBlack,
              width: 50,
              height: 50,
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
                          .copyWith(fontSize: 14),
                    ),
                    Text(
                      'SIGN UP',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 14),
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
                    children: [
                      const LoginViewBody(),
                      SignUpViewBody(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
