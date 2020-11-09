import 'package:Languor/models/achievement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Languor/models/sound.dart';
import 'package:Languor/models/category.dart';
import 'package:Languor/models/skill.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference soundCollection =
      FirebaseFirestore.instance.collection('sounds');

  // final CollectionReference categorySoundCollection = FirebaseFirestore.instance
  //     .collection('categories')
  //     .doc('1Tcu5BKRGAaHhJ8DWmHI')
  //     .collection('sounds');

  final CollectionReference categorySleepCollection =
      FirebaseFirestore.instance.collection('categories');

  final CollectionReference achievementCollection =
      FirebaseFirestore.instance.collection('achievements');

  final CollectionReference skillCollection =
      FirebaseFirestore.instance.collection('skills');

//sound list from snapshot
  List<Sound> _soundListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => Sound(
            name: doc.data()['name'].toString() ?? '',
            description: doc.data()['description'].toString() ?? '',
            soundUrl: doc.data()['soundUrl'].toString() ?? '',
            imageUrl: doc.data()['imageUrl'].toString() ?? '',
            category: doc.data()['category'].toString() ?? ''))
        .toList();
  }

  List<Sound> _categorySoundListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => Sound(
            name: doc.data()['name'].toString() ?? '',
            description: doc.data()['description'].toString() ?? '',
            soundUrl: doc.data()['soundUrl'].toString() ?? '',
            imageUrl: doc.data()['imageUrl'].toString() ?? '',
            category: doc.data()['category'].toString() ?? ''))
        .toList();
  }

  List<Achievement> _achievementListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => Achievement(
            name: doc.data()['name'].toString() ?? '',
            description: doc.data()['description'].toString() ?? '',
            imageUrl: doc.data()['imageUrl'].toString() ?? '',
            level: doc.data()['level'].toString() ?? '0'))
        .toList();
  }

  List<Skill> _skillListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => Skill(
            name: doc.data()['name'].toString() ?? '',
            description: doc.data()['description'].toString() ?? '',
            imageUrl: doc.data()['imageUrl'].toString() ?? '',
            level: doc.data()['level'].toString() ?? '0'))
        .toList();
  }

  List<Category> _categorySleepListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => Category(name: doc.data()['name'].toString() ?? ''))
        .toList();
  }

//get sounds stream
  Stream<List<Sound>> get sounds {
    return soundCollection.snapshots().map(_soundListFromSnapshot);
  }

  Stream<List<Sound>> get sleepSounds {
    return soundCollection
        .where('category', isEqualTo: 'Sleep')
        .snapshots()
        .map(_categorySoundListFromSnapshot);
  }

  // Stream<List<Sound>> get categorySounds {
  //   return categorySoundCollection
  //       .snapshots()
  //       .map(_categorySoundListFromSnapshot);
  // }

  Stream<List<Category>> get categories {
    return categorySleepCollection
        .snapshots()
        .map(_categorySleepListFromSnapshot);
  }

  Stream<List<Achievement>> get achievements {
    return achievementCollection.snapshots().map(_achievementListFromSnapshot);
  }

  Stream<List<Skill>> get skills {
    return skillCollection.snapshots().map(_skillListFromSnapshot);
  }
}
