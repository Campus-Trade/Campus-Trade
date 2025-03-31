import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:campus_trade/features/auth/domain/entities/user_entity.dart';
import 'package:campus_trade/features/auth/domain/repos/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  SignupCubit(this.authRepo) : super(SignupInitial());

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    String firstName,
    String lastName,
    String mobileNumber,
    File? imageFile,
    String university,
    String faculty,
  ) async {
    emit(SignupLoading());

    var existingUser = await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (existingUser.docs.isNotEmpty) {
      emit(SignupFailure(message: "Email is already in use!"));
      return;
    }

    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    String uid = userCredential.user!.uid;
    String? imageUrl;

    if (imageFile != null) {
      String fileName = "$uid.jpg";
      TaskSnapshot snapshot =
          await _storage.ref('profile_images/$fileName').putFile(imageFile);

      imageUrl = await snapshot.ref.getDownloadURL();
    }

    final result = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      firstName,
      lastName,
      mobileNumber,
      imageUrl, // Pass imageUrl instead of File
      university,
      faculty,
    );

    result.fold(
      (failure) => emit(
        SignupFailure(message: failure.message),
      ),
      (userEntity) => emit(
        SignupSuccess(userEntity: userEntity),
      ),
    );
  }
}
