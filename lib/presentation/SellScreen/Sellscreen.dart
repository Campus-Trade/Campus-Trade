import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:campus_trade/presentation/SellScreen/widgets/DataTextField.dart';
import 'package:campus_trade/presentation/Upload/widgets/AppBar_Upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/DoneButton.dart';

class Sellscreen extends StatefulWidget {
  File? image;
  String? imageUrl;
  Sellscreen({super.key, required this.image, required this.imageUrl});

  @override
  State<Sellscreen> createState() => _SellscreenState();
}

class _SellscreenState extends State<Sellscreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');
  void addProductData() async {
    if (_formKey.currentState!.validate()) {
      try {
        await products.add({
          "name": productNameController.text,
          "description": descriptionController.text,
          "price": priceController.text,
          "address": addressController.text,
          "imageUrl": widget.imageUrl,
        });
        print(widget.imageUrl);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Product added successfully!")));

        setState(() {
          productNameController.clear();
          descriptionController.clear();
          priceController.clear();
          addressController.clear();
        });
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error adding product: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUpload(isvisible: true),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: FileImage(widget.image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
                height: 50,
              ),
              Datatextfield(
                  hinttext: "Product Name", Controller: productNameController),
              Datatextfield(
                  hinttext: "Description", Controller: descriptionController),
              Datatextfield(hinttext: "Price", Controller: priceController),
              Datatextfield(
                  hinttext: "Your Address", Controller: addressController),
              SizedBox(
                height: 60.h,
              ),
              DoneButton(
                Continue: () => addProductData(),
                text: "Continue",
              )
            ],
          ),
        ),
      ),
    );
  }
}
