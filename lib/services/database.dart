import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference soundCollection =
      FirebaseFirestore.instance.collection('sounds');

  Future updateUserData(
      String name, String soundUrl, String imageUrl, String videoUrl) async {
    return await soundCollection.doc(uid).set({
      'name': name,
      'soundUrl': soundUrl,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
    });
  }
}
