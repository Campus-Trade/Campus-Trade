import 'package:campus_trade/core/utils/resources/color_manager.dart';
import 'package:campus_trade/features/product/presentaion/cubit/present_product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/services/get_it_sevice.dart';
import '../../../../../core/shared_widgets/common_app_bar.dart';
import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/utils/resources/text_styles.dart';
import '../../../data/repo/present_product_repo.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          create: (context) =>
              ProductCubit(getIt<PresentDataRepo>())..fetchAllProducts(),
        ),
      ],
      child: SingleChildScrollView(
        child: Scaffold(
          body: BlocBuilder<ProductCubit, PresentProductState>(
            builder: (context, state) {
              if (state is PresentProductLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is PresentProductError) {
                return Center(child: Text(state.message));
              }

              if (state is PresentProductLoaded) {
                return Column(
                  children: [
                    CommonAppBar(
                      title: "Description",
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.r),
                            bottomRight: Radius.circular(30.r)),
                        image: DecorationImage(
                            image: NetworkImage("product.image"),
                            fit: BoxFit.cover),
                      ),
                      width: 393.w,
                      height: 377.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        //   UserDataRow(sellerId: sellerId),
                        Row(
                          children: [
                            Text(
                              "product Tool Tittle",
                              style: TextStyles.black14Bold,
                              softWrap: true,
                            ),
                            Spacer(),
                            Text("product priceEGP",
                                style: TextStyles.black14Bold),
                          ],
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          "Description",
                          style: TextStyles.blue14Bold,
                        ),
                        Text(
                          "product description",
                          style: TextStyles.black14Regular400,
                          softWrap: true,
                        ),
                        Text(
                          "Address",
                          style: TextStyles.blue14Bold,
                        ),
                        Text(
                          "product.address",
                          style: TextStyles.black14Regular400,
                          softWrap: true,
                        ),
                        CustomButton(
                          backgroundColor: ColorManager.SecondaryColor,
                          textStyle: TextStyles.white14Bold,
                          labelText: "Add to Cart",
                          onPressed: () {},
                          width: 353.w,
                          height: 42.h,
                        ),
                        SizedBox(
                          width: 18.w,
                        ),
                        CustomButton(
                          backgroundColor: ColorManager.PrimaryColor,
                          textStyle: TextStyles.blue14Bold,
                          labelText: "Chat with Seller",
                          borderColor: ColorManager.SecondaryColor,
                          onPressed: () {},
                          width: 353.w,
                          height: 42.h,
                        ),
                      ]),
                    )
                  ],
                );
              }

              return const Center(child: Text('No products available'));
            },
          ),
        ),
      ),
    );
  }
}
