import 'package:bagstore/Core/Uitls/api_services.dart';
import 'package:bagstore/Core/Uitls/endBoint.dart';
import 'package:bagstore/Core/Uitls/models/Bag_Auth_Model/bag_Auth_model.dart';
import 'package:bagstore/Core/errors/Failure.dart';
import 'package:bagstore/Core/errors/servier_failure.dart';
import 'package:bagstore/Feature/AuthView/login/data/repositories/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepoImpl extends LoginRepo {
  @override
  Future<Either<Failure, BagAuthModel>> loginUser({
    required String email,
    required String password,
    String? lang,
  }) async {
    try {
      var response = await ApiServices.getData(
        endpoint: Loginendpoint,
        lang: lang ?? 'en',
        data: {'email': email, 'password': password},
      );
      final BagAuthModel user =
          BagAuthModel.fromJson(response as Map<String, dynamic>);
      return right(user);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BagAuthModel>> loginWithGoogle() {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }
}


// // 
//   void LoginUser({
//     String? lang,
//     required String Email,
//     required String password,
//   }) async {
//     emit(LoginLoading());
//     await ApiServices.postData(
//         lang: lang ?? 'en',
//         endpoint: Loginendpoint,
//         data: {
//           'email': Email,
//           'password': password,
//         }).then((value) {
//       bagLoginModel = BagAuthModel.fromJson(value.data);
//       emit(LoginSucess(bagLoginModel: bagLoginModel!));
//     }).catchError((error) {
//       print(error.toString());
//       emit(LoginErorr(error: error.toString()));
//     });
//   }