import 'package:campus_trade/core/errors/exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'The account already exists for that email.');
      } else {
        throw CustomException(
            message: 'An error occurred. Please try again later.');
      }
    } catch (e) {
      throw CustomException(
          message: 'An error occurred. Please try again later.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      print(
          "Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'Email or passwrd is incorrect ');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'Email or passwrd is incorrect');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(message: 'Email or passwrd is incorrect');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'Poor internet connection');
      } else {
        throw CustomException(
            message: 'Something went wrong please try again later');
      }
    } catch (e) {
      print(
          "Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}");

      throw CustomException(
          message: 'Something went wrong please try again later');
    }
  }
}
