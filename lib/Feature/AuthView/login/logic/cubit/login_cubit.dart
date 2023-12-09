import 'package:bagstore/Core/models/Bag_Auth_Model/bag_auth_model.dart';
import 'package:bagstore/Feature/AuthView/login/data/repositories/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  final LoginRepo loginRepo;

  void userSignIn({
    required String email,
    required String password,
  }) {
    emit(LoginLoading());

    loginRepo
        .loginUser(
      email: email,
      password: password,
    )
        .then((value) {
      value.fold(
        (failure) {
          emit(LoginErorr(error: failure.errMessage.toString()));
        },
        (user) {
          //  LocalServices.saveData(key: token,value: );

          emit(LoginSucess(bagLoginModel: user));
        },
      );
    });
  }

  bool isPasswordShow = true;
  Widget icon = const Icon(Icons.visibility_off);
  void changepasswordVisiability() {
    isPasswordShow = !isPasswordShow;

    icon = isPasswordShow
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);

    emit(LoginChangePasswordVisiablity());
  }
}
