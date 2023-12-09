import 'package:bagstore/Core/models/Bag_Auth_Model/bag_auth_model.dart';
import 'package:bagstore/Core/errors/failuer.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failure, BagAuthModel>> loginUser({
    required String email,
    required String password,
    String? lang,
  });

  // Future<Either<Failure, BagAuthModel>> loginWithGoogle();
}
