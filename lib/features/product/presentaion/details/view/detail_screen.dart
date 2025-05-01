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
import '../widgets/user_data_row.dart';

class DetailScreen extends StatefulWidget {
  final String productId;
  const DetailScreen({super.key, required this.productId});

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
              final product = state.productModel.firstWhere(
                (p) => p.productId == widget.productId,
                orElse: () => throw Exception('Product not found'),
              );

              return SingleChildScrollView(
                child: Column(
                  children: [
                    CommonAppBar(title: "Description"),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.r),
                          bottomRight: Radius.circular(30.r),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                              product.imageUrl), // Use actual product image
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: 393.w,
                      height: 377.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          UserDataRow(sellerId: product.userId),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  product.name,
                                  style: TextStyles.black16Bold,
                                ),
                              ),
                              Text(
                                "${product.price} EGP",
                                style: TextStyles.black16Bold,
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Description",
                            style: TextStyles.black16Bold,
                          ),
                          Text(
                            product.description, // Actual description
                            style: TextStyles.black14Regular400,
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Address",
                            style: TextStyles.black16Bold,
                          ),
                          Text(
                            product.address, // Actual address
                            style: TextStyles.black14Regular400,
                          ),
                          SizedBox(height: 30.h),
                          CustomButton(
                            backgroundColor: ColorManager.SecondaryColor,
                            textStyle: TextStyles.white14Bold,
                            labelText: "Add to Cart",
                            onPressed: () {},
                            width: 353.w,
                            height: 42.h,
                          ),
                          SizedBox(height: 18.h),
                          CustomButton(
                            backgroundColor: ColorManager.PrimaryColor,
                            textStyle: TextStyles.blue14Bold,
                            labelText: "Chat with Seller",
                            borderColor: ColorManager.SecondaryColor,
                            onPressed: () {},
                            width: 353.w,
                            height: 42.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: Text('No products available'));
          },
        ),
      ),
    );
  }
}
