import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/models/user_model.dart';
import 'AddData_State.dart';

class AddData extends Cubit<AddDataState> {
  AddData() : super(AddInitial());
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');
  String imageUrl = "";

  void addProductData(
      GlobalKey<FormState> formKey, BuildContext context) async {
    emit(AddLoading());
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception("User not logged in");
      }
      final userModel =
          await UserModel.getUserModelFromFirestore(currentUser.uid);

      if (userModel == null) {
        throw Exception("User data not found");
      }
      await products.add({
        "name": productNameController.text,
        "description": descriptionController.text,
        "price": priceController.text,
        "address": addressController.text,
        "imageUrl": imageUrl,
        "userId": currentUser.uid,
      });
      print(imageUrl);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Product added successfully!")));

      emit(AddSuccess());
      clearData();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error adding product: $e")));
    }
  }

  void clearData() {
    productNameController.clear();
    descriptionController.clear();
    priceController.clear();
    addressController.clear();
  }
}
