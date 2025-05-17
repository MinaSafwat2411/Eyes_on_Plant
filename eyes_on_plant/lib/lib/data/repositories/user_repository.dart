import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user/user_model.dart';

class UserRepository {
  Future<UserModel> getUserDate(String userId) async {
    DocumentReference<Map<String, dynamic>> userDoc = FirebaseFirestore.instance
        .collection("Users")
        .doc(userId);
    DocumentSnapshot<Map<String, dynamic>> userSnapshot = await userDoc.get();
    if (userSnapshot.exists) {
      UserModel user = UserModel.fromJson(userSnapshot);
      return user;
    } else {
      return UserModel();
    }
  }

  Future<void> addUserData(UserModel user) async {
    DocumentReference<Map<String, dynamic>> userDoc = FirebaseFirestore.instance
        .collection("Users")
        .doc(user.uid);
    await userDoc.set(user.toJson());
  }
}
