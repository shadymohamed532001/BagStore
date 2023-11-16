import 'package:bagstore/Core/Uitls/_constants.dart';
import 'package:bagstore/Core/api/api_services.dart';
import 'package:bagstore/Core/api/end_boint.dart';
import 'package:bagstore/Feature/Home/presentation/View/profile_view.dart';
import 'package:bagstore/Feature/Home/presentation/View/store_view.dart';
import 'package:bagstore/Feature/Home/presentation/View/widgets/home_view_body.dart';
import 'package:bagstore/Feature/Home/presentation/View/wishlist_view.dart';
import 'package:bagstore/Feature/Home/presentation/ViewModels/HomeModel/home_model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Widget> navBarScreans = [
    const HomeViewBody(),
    const StoreView(),
    const WishListView(),
    const ProfileView()
  ];

  int currentIndex = 0;

  void changeBottomIndex(int index) {
    currentIndex = index;
    emit(HomeChangeBottomIndex());
  }

  HomeModel? homeModel;
  Future homeGetData() async {
    emit(HomeLoading());

    try {
      var responses = await ApiServices.getData(
        endpoint: homeendPoint,
        token: token,
        lang: 'en',
      );

      homeModel = HomeModel.fromJson(responses);
      emit(HomeSucess(homeModel: homeModel!));

      return homeModel;
    } catch (e) {
      emit(HomeError(error: e.toString()));
    }
  }
}
