import 'package:bloc/bloc.dart';
import 'package:campus_trade/features/home/data/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failure.dart';
import '../../data/repo/present_product_repo.dart';

part 'present_product_state.dart';

class ProductCubit extends Cubit<PresentProductState> {
  final PresentDataRepo productRepository;
  final Map<String, String> _sellerNamesCache = {};

  ProductCubit(this.productRepository) : super(PresentProductInitial());

  Future<void> fetchAllProducts() async {
    emit(PresentProductLoading());
    try {
      final result = await productRepository.getAllProducts();
      result.fold(
        (failure) => emit(PresentProductError(failure.message)),
        (products) {
          emit(PresentProductLoaded(productModel: products));
        },
      );
    } catch (e) {
      emit(PresentProductError("Failed to load products: ${e.toString()}"));
    }
  }

  Future<String> getSellerNameForProduct(String sellerId) async {
    if (_sellerNamesCache.containsKey(sellerId)) {
      return _sellerNamesCache[sellerId]!;
    }

    final result = await productRepository.getUserNameById(sellerId);
    final sellerName = result.fold(
      (failure) => 'Unknown Seller',
      (name) => name,
    );

    _sellerNamesCache[sellerId] = sellerName;
    return sellerName;
  }
}
