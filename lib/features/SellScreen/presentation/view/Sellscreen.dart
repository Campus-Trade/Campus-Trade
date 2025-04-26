import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Upload/Cubit/addproduct_cubit/AddData_Class.dart';
import '../../../Upload/Cubit/addproduct_cubit/TestProduct.dart';
import '../../../home/presentaion/cubit/present_product_cubit.dart';
import '../../../home/presentaion/view/home_screen.dart';
import '../../cubit/UploadCubit_class.dart';
import '../../../Upload/widget/AppBar_Upload.dart';
import '../widget/DataTextField.dart';
import '../widget/DoneButton.dart';
import '../widget/SegmentSellButton.dart';
import '../../cubit/UploadCubit_State.dart';

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
            BlocConsumer<Testproduct, productState>(listener: (context, state) {
              if (state == productState.Sell) {}
            }, builder: (context, state) {
              return Column(
                children: [
                  Datatextfield(
                    hinttext: "Product Name",
                    controller: addCubit.productNameController,
                    currentState: state,
                  ),
                  Datatextfield(
                    hinttext: "Description",
                    controller: addCubit.descriptionController,
                    currentState: state,
                  ),
                  Datatextfield(
                    hinttext: "Price",
                    controller: addCubit.priceController,
                    isPriceField: true,
                    currentState: state,
                    isVisible: state == productState.Sell,
                  ),
                  Datatextfield(
                    hinttext: "Your Address",
                    controller: addCubit.addressController,
                    currentState: state,
                  ),
                  SizedBox(height: 60.h),
                  DoneButton(
                    Continue: () async {
                      if (_formKey.currentState!.validate()) {
                        // أضف هذا الجزء لتحديث البيانات
                        if (mounted) {
                          addCubit.addProductData(_formKey, context);
                          context
                              .read<ProductCubit>()
                              .fetchAllProducts(); // تحديث القائمة

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        }
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
