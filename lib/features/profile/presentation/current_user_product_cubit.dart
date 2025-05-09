import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../product/data/model/product_model.dart';
import '../data/current_user_product.dart';

part 'current_user_product_state.dart';

class CurrentUserProductsCubit extends Cubit<CurrentUserProductsState> {
  final CurrentUserProductRepo currentUserProductsRepo;

  CurrentUserProductsCubit(this.currentUserProductsRepo)
      : super(CurrentUserProductsInitial());

  Future<void> fetchAllProducts() async {
    emit(CurrentUserProductsLoading());
    try {
      final products = await currentUserProductsRepo.fetchProducts();

      if (products.isEmpty) {
        emit(CurrentUserProductsError("No products available"));
      } else {
        emit(CurrentUserProductsLoaded(products));
      }
    } catch (e) {
      emit(
          CurrentUserProductsError("Failed to load products: ${e.toString()}"));
    }
  }
}
