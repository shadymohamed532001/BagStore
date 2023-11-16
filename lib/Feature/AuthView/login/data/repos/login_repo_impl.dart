import 'package:bagstore/Core/api/api_services.dart';
import 'package:bagstore/Core/api/end_boint.dart';
import 'package:bagstore/Core/models/Bag_Auth_Model/bag_auth_model.dart';
import 'package:bagstore/Core/errors/_failuer.dart';
import 'package:bagstore/Core/errors/servier_failure.dart';
import 'package:bagstore/Feature/AuthView/login/data/repos/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepoImpl extends LoginRepo {
  @override
  Future<Either<failure, BagAuthModel>> loginUser({
    required String email,
    required String password,
    String? lang,
  }) async {
    try {
      var response = await ApiServices.getData(
          endpoint: loginendpoint,
          data: {'email': email, 'password': password});
      print(response);
      final BagAuthModel user = BagAuthModel.fromJson(response);
      return right(user);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServiersFailuers.fromDioError(e),
        );
      }
      return left(ServiersFailuers(e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, BagAuthModel>> loginWithGoogle() {
  //   // TODO: implement loginWithGoogle
  //   throw UnimplementedError();
  // }
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