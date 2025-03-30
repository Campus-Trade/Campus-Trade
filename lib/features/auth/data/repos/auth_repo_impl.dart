import 'package:campus_trade/core/errors/exception.dart';
import 'package:campus_trade/core/errors/failure.dart';
import 'package:campus_trade/core/services/firebase_auth_services.dart';
import 'package:campus_trade/features/auth/data/models/user_model.dart';
import 'package:campus_trade/features/auth/domain/entities/user_entity.dart';
import 'package:campus_trade/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl({required this.firebaseAuthServices});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String firstName,
    String lastName,
    String mobileNumber,
    String image,
    String university,
    String faculty,
  ) async {
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(
        user,
        {
          'firstName': firstName,
          'lastName': lastName,
          'mobileNumber': mobileNumber,
          'image': image,
          'university': university,
          'faculty': faculty,
        },
      ));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(
        ServerFailure(
          'An error occurred. Please try again later.',
        ),
      );
    }
  }
}
