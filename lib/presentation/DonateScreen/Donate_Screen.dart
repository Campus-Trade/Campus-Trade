import 'package:campus_trade/presentation/Cubit/AddData_Class.dart';
import 'package:campus_trade/presentation/Cubit/UploadCubit_State.dart';
import 'package:campus_trade/presentation/SellScreen/views/SegmentSellButton.dart';
import 'package:campus_trade/presentation/Upload/widgets/AppBar_Upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../SellScreen/views/DataTextField.dart';
import '../SellScreen/views/DoneButton.dart';
import '../Cubit/UploadCubit_class.dart';

class DonateScreen extends StatefulWidget {
  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
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
            return Center(child: CircularProgressIndicator());
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
                      hinttext: "Your Address",
                      Controller: addCubit.addressController),
                  SizedBox(
                    height: 60.h,
                  ),
                  DoneButton(
                    Continue: () => addCubit.addProductData(_formKey, context),
                    text: "Confirm",
                  )
                ],
              ),
            ),
          );
        }));
  }
}
