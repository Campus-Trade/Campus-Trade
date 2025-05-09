import 'package:campus_trade/core/errors/failure.dart';
import 'package:campus_trade/features/SellScreen/Data/model/Sell_Product_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class SellProductRepo {
  Future<Either<Failure, SellProductModel>> uploadProductData(
      SellProductModel sellProductModel) async {
    try {
      final collectionRef = FirebaseFirestore.instance.collection("products");
      final docRef = await collectionRef.add({
        "category": sellProductModel.category,
        "productState": sellProductModel.productState,
        "name": sellProductModel.productName,
        "description": sellProductModel.description,
        "price": sellProductModel.price,
        "address": sellProductModel.address,
        "imageUrl": sellProductModel.imageUrl,
        "userId": sellProductModel.userId,
      });
      await collectionRef.doc(docRef.id).update({"productId": docRef.id});

      // Create a new instance with the updated productId
      final updatedProduct = SellProductModel(
        category: sellProductModel.category,
        productId: docRef.id,
        productState: sellProductModel.productState,
        productName: sellProductModel.productName,
        description: sellProductModel.description,
        price: sellProductModel.price,
        address: sellProductModel.address,
        imageUrl: sellProductModel.imageUrl,
        userId: sellProductModel.userId,
      );

      return right(updatedProduct);
    } catch (e) {
      return left(ServerFailure("Error uploading product data: $e"));
    }
  }
}
