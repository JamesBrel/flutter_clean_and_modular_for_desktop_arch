import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userId;
  final String photo;
  final String lastName;
  final String firstName;
  final String createdAt;
  final String updatedAt;
  UserModel({
    this.userId = '',
    this.photo = '',
    this.lastName = '',
    this.firstName = '',
    this.createdAt = '',
    this.updatedAt = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'photo': photo,
      'lastName': lastName,
      'firstName': firstName,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] ?? '',
      photo: map['photo'] ?? '',
      lastName: map['lastName'] ?? '',
      firstName: map['firstName'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }
}
