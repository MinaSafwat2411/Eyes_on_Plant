import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyes_on_plant/lib/data/models/vegetables/vegetables_model.dart';

class VegetablesRepository {
  Future<List<VegetablesModel>> getVegetables() async {
    final snapshot =
        await FirebaseFirestore.instance.collection("Vegetables").get();

    return snapshot.docs
        .map((doc) => VegetablesModel.fromJson(doc.data()))
        .toList();
  }
}
