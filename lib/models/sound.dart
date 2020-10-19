import 'package:cloud_firestore/cloud_firestore.dart';

class SoundModel {
  String description;
  String soundUrl;
  String imageUrl;

  SoundModel({this.description, this.soundUrl, this.imageUrl});

  SoundModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    description = documentSnapshot.data()['description'] as String;
    soundUrl = documentSnapshot.data()['sound_url'] as String;
    imageUrl = documentSnapshot.data()['image_url'] as String;
  }
}
