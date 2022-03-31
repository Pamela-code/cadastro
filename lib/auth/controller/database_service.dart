import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future createUserData(String name, String phone, String email,
      String password, String uid) async {
    return await usersCollection.doc(uid).set({
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    });
  }
}
