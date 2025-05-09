part of 'current_user_product_cubit.dart';

@immutable
abstract class CurrentUserProductsState {}

class CurrentUserProductsInitial extends CurrentUserProductsState {}

class CurrentUserProductsLoading extends CurrentUserProductsState {}

class CurrentUserProductsError extends CurrentUserProductsState {
  final String message;

  CurrentUserProductsError(this.message);
}

class CurrentUserProductsLoaded extends CurrentUserProductsState {
  final List<ProductModel> productModel;

  CurrentUserProductsLoaded(this.productModel);
}
