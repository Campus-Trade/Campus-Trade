import 'dart:io';

import 'package:campus_trade/presentation/Cubit/Cubit_State.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class uploadCubit extends Cubit<UploadState> {
  uploadCubit() : super(UploadIntial());

  void uploadImage(context, File? _image) async {
    if (_image == null) {
      emit(UploadFailure(errormessage: "No image Selected"));
    }
    emit(UploadLoading());
    try {
      final storage = FirebaseStorage.instanceFor(
          bucket: "gs://campus-trade1.firebasestorage.app");
      final storageRef = FirebaseStorage.instance.ref().child(_image!.path);
      UploadTask uploadTask = storageRef.putFile(_image);

      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      emit(UploadSuccess(imageUrl: downloadUrl));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('success'),
      ));
    } catch (ex) {
      emit(UploadFailure(errormessage: ex.toString()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(ex.toString()),
      ));
    }
  }
}
