import 'package:campus_trade/features/profile/presentation/widgets/pending_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/shared_widgets/common_app_bar.dart';
import '../current_user_product_cubit.dart';

class PendingProducts extends StatefulWidget {
  const PendingProducts({super.key});

  @override
  State<PendingProducts> createState() => _PendingProductsState();
}

class _PendingProductsState extends State<PendingProducts> {
  @override
  void initState() {
    super.initState();
    final currentUserProductsCubit = GetIt.instance<CurrentUserProductsCubit>();
    currentUserProductsCubit.fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final currentUserProductsCubit = GetIt.instance<CurrentUserProductsCubit>();

    return Scaffold(
      appBar: CommonAppBar(title: 'Pending Uploads'),
      body: BlocProvider(
        create: (context) => currentUserProductsCubit,
        child: BlocBuilder<CurrentUserProductsCubit, CurrentUserProductsState>(
          builder: (context, state) {
            if (state is CurrentUserProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CurrentUserProductsError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is CurrentUserProductsLoaded) {
              final products = state.productModel;

              if (products.isEmpty) {
                return const Center(
                    child: Text('No Current products available'));
              }

              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return PendingProductCard(
                    productName: product.name,
                    productPrice: product.price,
                    productState: product.productState,
                    productImage: product.imageUrl,
                    productAddress: product.address,
                    productId: product.productId,
                  );
                },
              );
            } else {
              return const Center(child: Text('Something went wrong'));
            }
          },
        ),
      ),
    );
  }
}
