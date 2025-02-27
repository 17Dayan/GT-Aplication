// ignore: file_names
// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Loginstate extends Equatable {
  final String email;
  final String password;
  final GlobalKey<FormState>? formKey;
  const Loginstate({this.email = '', this.password = '', this.formKey});

  Loginstate copyWith(
      {String? email, String? password, GlobalKey<FormState>? formKey}) {
    return Loginstate(
        email: email ?? this.email,
        password: password ?? this.password,
        formKey: formKey);
  }

  @override
  // TODO: implement props

  List<Object?> get props => [email, password];
}
