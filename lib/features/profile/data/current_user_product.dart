import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../product/data/model/product_model.dart';

class CurrentUserProductRepo {
  final FirebaseFirestore firestore;
  final uid = FirebaseAuth.instance.currentUser?.uid;
  CurrentUserProductRepo(this.firestore);

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final productSnapshot = await firestore
          .collection('products')
          .where('userId', isEqualTo: uid)
          .get();

      return productSnapshot.docs
          .map((doc) => ProductModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception("Failed to load products: $e");
    }
  }

  Future<void> addProduct(ProductModel product) async {
    try {
      await firestore.collection('products').add(product.toMap());
    } catch (e) {
      throw Exception("Failed to add product: $e");
    }
  }

  Future<void> updateProduct(ProductModel product) async {
    try {
      await firestore
          .collection('products')
          .doc(product.productId)
          .update(product.toMap());
    } catch (e) {
      throw Exception("Failed to update product: $e");
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      await firestore.collection('products').doc(productId).delete();
    } catch (e) {
      throw Exception("Failed to delete product: $e");
    }
  }
}
