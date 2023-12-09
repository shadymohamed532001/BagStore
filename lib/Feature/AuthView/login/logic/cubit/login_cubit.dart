import 'package:bagstore/Core/api/dio_consumer.dart';
import 'package:bagstore/Core/api/end_boint.dart';
import 'package:bagstore/Core/models/Bag_Auth_Model/bag_auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  BagAuthModel? bagLoginModel;

  void LoginUser({
    String? lang,
    required String Email,
    required String password,
  }) async {
    emit(LoginLoading());
    await ApiServices.postData(
        lang: lang ?? 'en',
        endpoint: loginendpoint,
        data: {
          'email': Email,
          'password': password,
        }).then((value) {
      bagLoginModel = BagAuthModel.fromJson(value.data);
      emit(LoginSucess(bagLoginModel: bagLoginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErorr(error: error.toString()));
    });
  }

  bool isPasswordShow = true;
  Widget icon = const Icon(Icons.visibility_off);
  void ChangepasswordVisiability() {
    isPasswordShow = !isPasswordShow;

    icon = isPasswordShow
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);

    emit(LoginChangePasswordVisiablity());
  }
}
