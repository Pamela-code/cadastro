import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name, String phone) async {
    return await usersCollection.doc(uid).set({'name': name, 'phone': phone});
  }
}
