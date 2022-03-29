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

  @override
  String toString() {
    return '''
obscuredText: ${obscuredText},
acceptTerms: ${acceptTerms},
name: ${name},
email: ${email},
password: ${password},
phone: ${phone}
    ''';
  }
}
