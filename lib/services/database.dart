import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Languor/models/sound.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference soundCollection =
      FirebaseFirestore.instance.collection('sounds');

  // Future updateUserData(
  //     String name, String soundUrl, String imageUrl, String videoUrl) async {
  //   return await soundCollection.doc(uid).set({
  //     'name': name,
  //     'soundUrl': soundUrl,
  //     'imageUrl': imageUrl,
  //     'videoUrl': videoUrl,
  //   });
  // }

//sound list from snapshot
  List<Sound> _soundListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => Sound(
            name: doc.data()['name'].toString() ?? '',
            description: doc.data()['description'].toString() ?? '',
            soundUrl: doc.data()['soundUrl'].toString() ?? '',
            imageUrl: doc.data()['imageUrl'].toString() ?? ''))
        .toList();
  }

//get sounds stream
  Stream<List<Sound>> get sounds {
    return soundCollection.snapshots().map(_soundListFromSnapshot);
  }
}
