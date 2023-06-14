import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:huge_plant/data/model.dart';

class DatabaseHelper {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection(Plant.collectionName);
  // insert
  Future<DocumentReference> insertPlant(Plant plant) {
    return collection.add(plant.toJson());
  }

  // update
  void updatePlant(Plant plant) async {
    await collection.doc(plant.id).update(plant.toJson());
  }

  // delete
  void deletePlant(Plant plant) async {
    await collection.doc(plant.id).delete();
  }

  // get  all dociments from collection
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  //seach
  Future<QuerySnapshot> searchPlant(String keyValue) {
    return collection.where(Plant.colName, isEqualTo: keyValue).get();
  }
}
