import 'package:campus_trade/presentation/Cubit/addproduct_cubit/AddData_State.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      await products.add({
        "name": productNameController.text,
        "description": descriptionController.text,
        "price": priceController.text,
        "address": addressController.text,
        "imageUrl": imageUrl,
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
