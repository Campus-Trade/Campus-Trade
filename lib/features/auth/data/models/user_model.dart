import 'package:campus_trade/features/auth/domain/entities/user_entity.dart';
import 'package:campus_trade/presentation/resources/image_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.firstName,
    required super.lastName,
    required super.mobileNumber,
    required super.email,
    required super.image,
    required super.university,
    required super.faculty,
    required super.uId,
  });

  factory UserModel.fromFirebaseUser(User user, Map<String, dynamic> userData) {
    return UserModel(
      firstName: userData['firstName'] as String? ?? '',
      lastName: userData['lastName'] as String? ?? '',
      mobileNumber: userData['mobileNumber'] as String? ?? '',
      email: user.email ?? '',
      image:
          userData['image'] != null && userData['image'].toString().isNotEmpty
              ? userData['image']
              : ImageManager.uploadPhoto,
      university: userData['university'] as String? ?? '',
      faculty: userData['faculty'] as String? ?? '',
      uId: user.uid,
    );
  }

  static Future<UserModel?> getUserModelFromFirestore(User user) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists && userDoc.data() != null) {
        return UserModel.fromFirebaseUser(
            user, userDoc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
    return null;
  }
}
