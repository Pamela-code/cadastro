import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future createUserData(String name, String phone, String email,
      String password, String uid) async {
    return await usersCollection.doc(uid).set({
      'id': uid,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    });
  }

  Future<void> updateUser(uid, key, newValue) {
    return usersCollection
        .doc(uid)
        .update({key: newValue})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
