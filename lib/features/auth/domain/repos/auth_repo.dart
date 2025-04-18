import 'package:campus_trade/core/errors/failure.dart';
import 'package:campus_trade/features/auth/data/models/login_request_model.dart';
import 'package:campus_trade/features/auth/data/models/regiter_request_model.dart';
import 'package:campus_trade/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> createUserWithEmailAndPassword(
    RegisterRequestModel registerRequestModel,
  );
  Future<Either<Failure, String>> signInWithEmailAndPassword(
    LoginRequestModel loginRequestModel,
  );
}
