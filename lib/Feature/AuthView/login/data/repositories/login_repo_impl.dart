import 'package:bagstore/Core/api/api_services.dart';
import 'package:bagstore/Core/api/end_boint.dart';
import 'package:bagstore/Core/models/Bag_Auth_Model/bag_auth_model.dart';
import 'package:bagstore/Core/errors/_failuer.dart';
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
      var response = await ApiServices.postData(endpoint: loginendpoint, data: {
        'email': email,
        'password': password,
      });
      final BagAuthModel user = BagAuthModel.fromJson(response.data);
      return right(user);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
