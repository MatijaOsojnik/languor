import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference soundCollection =
      FirebaseFirestore.instance.collection('sounds');
}
