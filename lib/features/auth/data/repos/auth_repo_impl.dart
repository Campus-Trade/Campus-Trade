import 'dart:math';

import 'package:campus_trade/core/errors/exception.dart';
import 'package:campus_trade/core/errors/failure.dart';
import 'package:campus_trade/core/services/firebase_auth_services.dart';
import 'package:campus_trade/features/auth/data/models/user_model.dart';
import 'package:campus_trade/features/auth/domain/repos/auth_repo.dart';
import 'package:campus_trade/presentation/resources/image_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/login_request_model.dart';
import '../models/regiter_request_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  AuthRepoImpl({required this.firebaseAuthServices});

  @override
  Future<Either<Failure, UserModel>> createUserWithEmailAndPassword(
    RegisterRequestModel registerRequestModel,
  ) async {
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: registerRequestModel.email,
        password: registerRequestModel.password,
      );

      UserModel userModel = UserModel(
        firstName: registerRequestModel.firstName,
        lastName: registerRequestModel.lastName,
        mobileNumber: registerRequestModel.phone,
        email: registerRequestModel.email,
        image: registerRequestModel.image ?? ImageManager.DefaultPic,
        university: registerRequestModel.university,
        faculty: registerRequestModel.faculty,
        uId: user.uid,
        createdAt: Timestamp.now(),
      );

      return right(userModel);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure('An error occurred. Please try again later.'));
    }
  }

  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: loginRequestModel.email,
        password: loginRequestModel.password,
      );
      return right(user.uid);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure('Something went wrong please try again later'));
    }
  }

  @override
  Future<Either<Failure, String>> signInWithGoogle() async {
    try {
      var userCredential = await firebaseAuthServices.signInWithGoogle();
      final uid = userCredential.user?.uid;
      if (uid != null) {
        return right(uid);
      } else {
        return left(ServerFailure("User UID is null"));
      }
    } catch (e) {
      print('Exception in google auth ${e.toString()}');
    }
    return left(ServerFailure("try again"));
  }

  @override
  Future<Either<Failure, String>> signInWithFacebook() async {
    try {
      var userCredential = await firebaseAuthServices.signInWithFacebook();
      final uid = userCredential.user?.uid;
      if (uid != null) {
        return right(uid);
      } else {
        return left(ServerFailure("User UID is null"));
      }
    } catch (e) {
      print('Exception in facebook auth ${e.toString()}');
    }
    return left(ServerFailure("try again"));
  }
}
