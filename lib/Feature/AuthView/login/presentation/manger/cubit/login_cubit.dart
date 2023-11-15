import 'package:bagstore/Core/Uitls/models/Bag_Auth_Model/bag_Auth_model.dart';
import 'package:bagstore/Feature/AuthView/login/data/repos/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  final LoginRepo loginRepo;

  void LoginUser({
    String? lang,
    required String Email,
    required String password,
  }) async {
    emit(LoginLoading());
    loginRepo.loginUser(email: Email, password: password).then((value) {
      value.fold(
        (falier) => LoginErorr(error: falier.errMessage.toString()),
        (user) => LoginSucess(bagLoginModel: user),
      );
      // value.fold((Failure) {}),
      //       value.fold((user) {})

      // bagLoginModel = BagAuthModel.fromJson(value.data);
      // emit(LoginSucess(bagLoginModel: bagLoginModel!));
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
