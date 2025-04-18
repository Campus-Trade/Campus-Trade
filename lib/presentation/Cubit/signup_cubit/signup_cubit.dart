import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:campus_trade/features/auth/data/models/regiter_request_model.dart';
import 'package:campus_trade/features/auth/domain/repos/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  SignupCubit(this.authRepo) : super(SignupInitial());

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String mobileNumber,
    File? imageFile,
    required String university,
    required String faculty,
  }) async {
    emit(SignupLoading());
    String? imageUrl;

    imageUrl = await _uploadProfileImage(imageFile);
    log('Image URL: $imageUrl');

    RegisterRequestModel registerRequestModel = RegisterRequestModel(
      firstName: firstName,
      lastName: lastName,
      phone: mobileNumber,
      email: email,
      password: password,
      confirmPassword: password,
      university: university,
      faculty: faculty,
      image: imageUrl,
    );

    final result = await authRepo.createUserWithEmailAndPassword(
      registerRequestModel,
    );

    result.fold(
      (failure) => emit(SignupFailure(message: failure.message)),
      (userModel) {
        // save id to shared preferences
        _createUserInFirestore(userModel);
        emit(SignupSuccess());
      },
    );
  }

  Future<String?> _uploadProfileImage(File? imageFile) async {
    if (imageFile != null) {
      String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      String uniqueFileName =
          '${imageFile.path.split('/').last.split('.').first}_$timestamp.jpg';

      TaskSnapshot snapshot = await _storage
          .ref('profile_images/$uniqueFileName')
          .putFile(imageFile);

      log('Image uploaded successfully: ${snapshot.ref.getDownloadURL()}');
      return await snapshot.ref.getDownloadURL();
    }
    return null;
  }

  Future<void> _createUserInFirestore(userModel) async {
    // it is better to separate the logic of creating user
    // (you can add it to repo then create new cubit for it) and call it in ui
    // when user registered successfully
    await _firestore
        .collection('users')
        .doc(userModel.uId)
        .set(
          userModel.toJson(),
        )
        .then((value) {
      // to check if the user is created successfully
      log('User created successfully in Firestore');
    });
  }
}
