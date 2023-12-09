import 'package:bagstore/Core/api/dio_consumer.dart';
import 'package:bagstore/Core/api/end_boint.dart';
import 'package:bagstore/Core/models/Bag_Auth_Model/bag_auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  BagAuthModel? bagAuthModel;

  void registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    String? lang,
  }) async {
    emit(RegisterLoading());
    await ApiServices.postData(
      endpoint: registerendPoint,
      lang: lang ?? 'en',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      bagAuthModel = BagAuthModel.fromJson(value.data);
      emit(RegisterSucess(bagRegisterModel: bagAuthModel!));
    }).catchError((error) {
      // print(error.toString());
      emit(RegisterError(error: error.toString()));
    });
  }

  bool isPasswordShow = true;

  Widget icon = const Icon(Icons.visibility_off);
  void changepasswordVisiability() {
    isPasswordShow = !isPasswordShow;

    icon = isPasswordShow
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);

    emit(RegisterChangePasswordVisiablity());
  }
}
