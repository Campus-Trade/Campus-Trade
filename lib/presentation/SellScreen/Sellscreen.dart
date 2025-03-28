import 'package:campus_trade/presentation/Cubit/AddData_Class.dart';
import 'package:campus_trade/presentation/Cubit/UploadCubit_State.dart';
import 'package:campus_trade/presentation/SellScreen/views/SegmentSellButton.dart';
import 'package:campus_trade/presentation/Upload/widgets/AppBar_Upload.dart';
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
    final uploadCubit = context.read<UploadCubit>();
    final addCubit = context.read<AddData>();
    return Scaffold(
        appBar: AppBarUpload(isvisible: true),
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
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage("$imageUrl"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Segmentsellbutton(),
                  const SizedBox(
                    width: 50,
                    height: 50,
                  ),
                  Datatextfield(
                      hinttext: "Product Name",
                      Controller: addCubit.productNameController),
                  Datatextfield(
                      hinttext: "Description",
                      Controller: addCubit.descriptionController),
                  Datatextfield(
                      hinttext: "Price", Controller: addCubit.priceController),
                  Datatextfield(
                      hinttext: "Your Address",
                      Controller: addCubit.addressController),
                  SizedBox(
                    height: 60.h,
                  ),
                  DoneButton(
                    Continue: () {
                      addCubit.addProductData(_formKey, context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }));
                    },
                    text: "Confirm",
                  )
                ],
              ),
            ),
          );
        }));
  }
}
