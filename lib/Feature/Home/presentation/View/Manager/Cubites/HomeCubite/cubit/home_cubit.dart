import 'package:bagstore/Core/Uitls/Constants.dart';
import 'package:bagstore/Core/Uitls/api_services.dart';
import 'package:bagstore/Core/Uitls/endBoint.dart';
import 'package:bagstore/Feature/Home/presentation/View/profile_view.dart';
import 'package:bagstore/Feature/Home/presentation/View/store_view.dart';
import 'package:bagstore/Feature/Home/presentation/View/widgets/HomeViewBody.dart';
import 'package:bagstore/Feature/Home/presentation/View/wishlist_view.dart';
import 'package:bagstore/Feature/Home/presentation/ViewModels/HomeModel/home_model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Widget> NavBarScreans = [
    const HomeViewBody(),
    const StoreView(),
    const WishListView(),
    const ProfileView()
  ];

  int currentIndex = 0;

  void ChangeBottomIndex(int index) {
    currentIndex = index;
    emit(HomeChangeBottomIndex());
  }

  HomeModel? homeModel;
  Future HomeGetData() async {
    emit(HomeLoading());

    try {
      var responses = await ApiServices.getData(
          endpoint: homeendPoint, token: token, lang: 'en');

      homeModel = HomeModel.fromJson(responses.data);
      emit(HomeSucess(homeModel: homeModel!));

      return homeModel;
    } catch (e) {
      emit(HomeError(error: e.toString()));
    }
  }
}
