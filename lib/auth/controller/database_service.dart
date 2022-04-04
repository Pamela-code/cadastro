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

  Future<void> updateUser(uid, newEmail, newName, newPhone, newPassword) {
    return usersCollection
        .doc(uid)
        .update({
          'name': newName,
          'email': newEmail,
          'phone': newPhone,
          'password': newPassword,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> deleteUser(uid) {
    return usersCollection
        .doc(uid)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
