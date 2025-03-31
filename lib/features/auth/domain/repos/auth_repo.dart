import 'package:campus_trade/core/errors/failure.dart';
import 'package:campus_trade/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email,
      String password,
      String firstName,
      String lastName,
      String mobileNumber,
      String? image,
      String university,
      String faculty);
}
