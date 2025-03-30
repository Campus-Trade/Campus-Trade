import 'package:campus_trade/presentation/Cubit/AddData_Class.dart';
import 'package:campus_trade/presentation/Cubit/TestProduct.dart';
import 'package:campus_trade/presentation/Cubit/UploadCubit_State.dart';
import 'package:campus_trade/presentation/SellScreen/views/SegmentSellButton.dart';
import 'package:campus_trade/presentation/Upload/views/AppBar_Upload.dart';
import 'package:campus_trade/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Cubit/UploadCubit_class.dart';
import 'views/DataTextField.dart';
import 'views/DoneButton.dart';

class SellScreen extends StatefulWidget {
  @override
  State<SellScreen> createState() => _SellscreenState();
}

class _SellscreenState extends State<SellScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final addCubit = context.read<AddData>();

    return Scaffold(
        body:
            BlocConsumer<UploadCubit, UploadState>(listener: (context, state) {
      if (state is UploadSuccess) {
        addCubit.imageUrl = state.imageUrl;
      }
    }, builder: (context, state) {
      String? imageUrl;
      if (state is UploadLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is UploadSuccess) {
        imageUrl = state.imageUrl;
      }

      return Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(children: [
            Stack(children: [
              Container(
                width: double.infinity,
                height: 377.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: imageUrl != null
                      ? DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        )
                      : null,
                  color: Colors.grey[300],
                ),
              ),
              AppBarUpload(isvisible: true),
            ]),
            SizedBox(height: 20.h),
            Segmentsellbutton(),
            const SizedBox(height: 50),
            BlocBuilder<Testproduct, productState>(builder: (context, state) {
              return Column(
                children: [
                  Datatextfield(
                      hinttext: "Product Name",
                      Controller: addCubit.productNameController),
                  Datatextfield(
                      hinttext: "Description",
                      Controller: addCubit.descriptionController),
                  if (state == productState.Sell)
                    Datatextfield(
                        hinttext: "Price",
                        Controller: addCubit.priceController),
                  Datatextfield(
                      hinttext: "Your Address",
                      Controller: addCubit.addressController),
                  SizedBox(height: 60.h),
                  DoneButton(
                    Continue: () {
                      if (_formKey.currentState!.validate()) {
                        addCubit.addProductData(_formKey, context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    },
                    text: "Confirm",
                  ),
                ],
              );
            }),
          ])));
    }));
  }
}
