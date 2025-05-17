import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/fruits/fruits_model.dart';

class FruitsRepository {

  Future<List<FruitsModel>> getFruits()async{
    final snapshot =
    await FirebaseFirestore.instance.collection("Fruits").get();

    return snapshot.docs
        .map((doc) => FruitsModel.fromJson(doc.data()))
        .toList();
  }
}