// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  final _$obscuredTextAtom = Atom(name: '_RegisterControllerBase.obscuredText');

  @override
  bool get obscuredText {
    _$obscuredTextAtom.reportRead();
    return super.obscuredText;
  }

  @override
  set obscuredText(bool value) {
    _$obscuredTextAtom.reportWrite(value, super.obscuredText, () {
      super.obscuredText = value;
    });
  }

  final _$acceptTermsAtom = Atom(name: '_RegisterControllerBase.acceptTerms');

  @override
  bool get acceptTerms {
    _$acceptTermsAtom.reportRead();
    return super.acceptTerms;
  }

  @override
  set acceptTerms(bool value) {
    _$acceptTermsAtom.reportWrite(value, super.acceptTerms, () {
      super.acceptTerms = value;
    });
  }

  final _$nameAtom = Atom(name: '_RegisterControllerBase.name');

  @override
  TextEditingController get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(TextEditingController value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterControllerBase.email');

  @override
  TextEditingController get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(TextEditingController value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_RegisterControllerBase.password');

  @override
  TextEditingController get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(TextEditingController value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$phoneAtom = Atom(name: '_RegisterControllerBase.phone');

  @override
  TextEditingController get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(TextEditingController value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$_authAtom = Atom(name: '_RegisterControllerBase._auth');

  @override
  FirebaseAuth get _auth {
    _$_authAtom.reportRead();
    return super._auth;
  }

  @override
  set _auth(FirebaseAuth value) {
    _$_authAtom.reportWrite(value, super._auth, () {
      super._auth = value;
    });
  }

  final _$usuarioAtom = Atom(name: '_RegisterControllerBase.usuario');

  @override
  User? get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(User? value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  final _$usersStreamAtom = Atom(name: '_RegisterControllerBase.usersStream');

  @override
  Stream<QuerySnapshot<Object?>> get usersStream {
    _$usersStreamAtom.reportRead();
    return super.usersStream;
  }

  @override
  set usersStream(Stream<QuerySnapshot<Object?>> value) {
    _$usersStreamAtom.reportWrite(value, super.usersStream, () {
      super.usersStream = value;
    });
  }

  final _$registrarAsyncAction =
      AsyncAction('_RegisterControllerBase.registrar');

  @override
  Future registrar(String email, String password, String name, String phone) {
    return _$registrarAsyncAction
        .run(() => super.registrar(email, password, name, phone));
  }

  final _$atualizarAsyncAction =
      AsyncAction('_RegisterControllerBase.atualizar');

  @override
  Future atualizar(String uid, String key, String newValue) {
    return _$atualizarAsyncAction
        .run(() => super.atualizar(uid, key, newValue));
  }

  final _$logoutAsyncAction = AsyncAction('_RegisterControllerBase.logout');

  @override
  ObservableFuture logout() {
    return ObservableFuture(_$logoutAsyncAction.run(() => super.logout()));
  }

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  dynamic clearFields() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.clearFields');
    try {
      return super.clearFields();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _authCheck() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase._authCheck');
    try {
      return super._authCheck();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _getUser() {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase._getUser');
    try {
      return super._getUser();
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obscuredText: ${obscuredText},
acceptTerms: ${acceptTerms},
name: ${name},
email: ${email},
password: ${password},
phone: ${phone},
usuario: ${usuario},
usersStream: ${usersStream}
    ''';
  }
}
