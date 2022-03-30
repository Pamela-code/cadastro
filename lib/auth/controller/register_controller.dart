import 'package:cadastro/auth/controller/database_service.dart';
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
  registrar(String email, String senha, String name, String phone) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
      await DatabaseService(uid: usuario!.uid).updateUserData(name, phone);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é fraca');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este e-mail já está cadastrado');
      }
    }
  }

  @action
  logout() async {
    await _auth.signOut();
    _getUser();
  }
}
