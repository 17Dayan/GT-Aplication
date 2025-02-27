// ignore: file_names
// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/utils/BlocFormItem.dart';

class Loginstate extends Equatable {
  final BlocFormItem email;
  final BlocFormItem password;
  final GlobalKey<FormState>? formKey;
  const Loginstate(
      {this.email = const BlocFormItem(error: 'Ingresa el Email'),
      this.password = const BlocFormItem(error: 'Ingresa la Contraseña'),
      this.formKey});

  Loginstate copyWith(
      {BlocFormItem? email,
      BlocFormItem? password,
      GlobalKey<FormState>? formKey}) {
    return Loginstate(
        email: email ?? this.email,
        password: password ?? this.password,
        formKey: formKey);
  }

  @override
  // TODO: implement props

  List<Object?> get props => [email, password];
}
