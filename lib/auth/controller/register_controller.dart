import 'package:cadastro/auth/controller/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  @observable
  bool obscuredText = true;

  @observable
  bool acceptTerms = false;

  @observable
  TextEditingController name = TextEditingController();

  @observable
  TextEditingController email = TextEditingController();

  @observable
  TextEditingController password = TextEditingController();

  @observable
  TextEditingController phone = TextEditingController();

  @action
  clearFields() {
    name.clear();
    email.clear();
    password.clear();
    phone.clear();
  }

  @observable
  FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  User? usuario;

  @action
  _RegisterControllerBase() {
    _authCheck();
  }

  @action
  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
    });
  }

  @action
  _getUser() {
    usuario = _auth.currentUser;
  }

  @action
  registrar(String email, String password, String name, String phone) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _getUser();
      await DatabaseService()
          .createUserData(name, phone, email, password, usuario!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é fraca');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este e-mail já está cadastrado');
      }
    }
  }

  @action
  updateFields(String uid) async {
    try {
      await DatabaseService().updateUser(
        uid,
        email.text,
        name.text,
        phone.text,
        password.text,
      );
    } catch (e) {
      print(e);
    }
  }

  @observable
  @action
  logout() async {
    await _auth.signOut();
    _getUser();
  }

  @observable
  Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
}
