import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? phone;
  final String? email;
  final String? name;
  final String? uid;

  UserModel({
    this.phone,
    this.email,
    this.name,
    this.uid,
  });

  factory UserModel.fromJson(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;

    if (data == null) {
      return UserModel();
    }
    return UserModel(
      phone: data['phone'],
      email: data['email'],
      name: data['name'],
      uid: data['uid'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'email': email,
      'name': name,
      'uid': uid,
    };
  }
}