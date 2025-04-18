import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uId;
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String email;
  final String image;
  final String university;
  final String faculty;
  final Timestamp createdAt;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.email,
    required this.image,
    required this.university,
    required this.faculty,
    required this.uId,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      mobileNumber: json['mobileNumber'],
      email: json['email'],
      image: json['image'],
      university: json['university'],
      faculty: json['faculty'],
      uId: json['uId'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'mobileNumber': mobileNumber,
      'email': email,
      'image': image,
      'university': university,
      'faculty': faculty,
      'uId': uId,
      'createdAt': createdAt,
    };
  }
}
