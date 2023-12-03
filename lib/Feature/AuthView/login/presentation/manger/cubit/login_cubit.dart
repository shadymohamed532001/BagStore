import 'package:bagstore/Core/models/Bag_Auth_Model/bag_auth_model.dart';
import 'package:bagstore/Feature/AuthView/login/data/repos/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  final LoginRepo loginRepo;

  void loginUser({
    String? lang,
    required String email,
    required String password,
  }) {
    print('inside login function');
    emit(LoginLoading());
    loginRepo.loginUser(email: email, password: password).then((value) {
      value.fold(
        (failure) {
          emit(LoginErorr(error: failure.errMessage));
          // print(failure.errMessage);
        },
        (user) {
          emit(LoginSucess(bagLoginModel: user));
        },
      );
    });

    // value.fold((Failure) {}),
    //       value.fold((user) {})

    // bagLoginModel = BagAuthModel.fromJson(value.data);
    // emit(LoginSucess(bagLoginModel: bagLoginModel!));
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
