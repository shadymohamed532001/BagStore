import 'package:bagstore/Feature/Home/presentation/View/Manager/Cubites/HomeCubite/cubit/home_cubit.dart';
import 'package:bagstore/Feature/Home/presentation/View/widgets/custom_navigtion_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubite = BlocProvider.of<HomeCubit>(context);
          return Scaffold(
            body: cubite.navBarScreans[cubite.currentIndex],
            bottomNavigationBar: CustomBottomNavBar(),
          );
        },
      ),
    );
  }
}
