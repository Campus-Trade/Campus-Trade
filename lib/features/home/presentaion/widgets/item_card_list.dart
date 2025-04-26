import 'package:campus_trade/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/get_it_sevice.dart';
import '../cubit/present_product_cubit.dart';
import 'item_card.dart';

class ItemCardList extends StatelessWidget {
  const ItemCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductCubit>()..fetchAllProducts(),
      child: SizedBox(
        height: 250.h,
        child: BlocBuilder<ProductCubit, PresentProductState>(
          builder: (context, state) {
            if (state is PresentProductLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PresentProductError) {
              return Center(child: Text(state.message));
            }

            if (state is PresentProductLoaded) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final product = state.productModel[index];
                  return FutureBuilder<String>(
                    future: context
                        .read<ProductCubit>()
                        .getSellerNameForProduct(product.userId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final sellerName = snapshot.data ?? 'Unknown Seller';
                      return ItemCard(
                        userName: sellerName,
                        productName: product.name,
                        productPrice: '\$${product.price}',
                        productAddress: product.address,
                        productImage: product.imageUrl,
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 16.w),
                itemCount: state.productModel.length,
              );
            }

            return const Center(child: Text('No products available'));
          },
        ),
      ),
    );
  }
}
