import 'package:campus_trade/core/errors/exception.dart';
import 'package:campus_trade/core/errors/failure.dart';
import 'package:campus_trade/core/services/firebase_auth_services.dart';
import 'package:campus_trade/features/auth/data/models/user_model.dart';
import 'package:campus_trade/features/auth/domain/entities/user_entity.dart';
import 'package:campus_trade/features/auth/domain/repos/auth_repo.dart';
import 'package:campus_trade/presentation/resources/image_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  AuthRepoImpl({required this.firebaseAuthServices});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String firstName,
    String lastName,
    String mobileNumber,
    String? imageUrl,
    String university,
    String faculty,
  ) async {
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);

      await firestore.collection('users').doc(user.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'mobileNumber': mobileNumber,
        'image': imageUrl ?? ImageManager.uploadPhoto,
        'university': university,
        'faculty': faculty,
        'createdAt': FieldValue.serverTimestamp(),
      });

      print(" Firestore Write Successful");

      return right(UserModel.fromFirebaseUser(
        user,
        {
          'firstName': firstName,
          'lastName': lastName,
          'mobileNumber': mobileNumber,
          'image': imageUrl ?? ImageManager.uploadPhoto,
          'university': university,
          'faculty': faculty,
        },
      ));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      print(" Firestore Write Failed: $e");
      return left(ServerFailure('An error occurred. Please try again later.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists && userDoc.data() != null) {
        var userModel = UserModel.fromFirebaseUser(
          user,
          userDoc.data() as Map<String, dynamic>,
        );
        return right(userModel);
      } else {
        return left(ServerFailure('User data not found'));
      }
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      print(
          'Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure('Something went wrong please try again later'));
    }
  }
}
