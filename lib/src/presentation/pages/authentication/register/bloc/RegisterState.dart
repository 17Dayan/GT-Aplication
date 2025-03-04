import 'package:equatable/equatable.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';

class RegisterState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem email;
  final BlocFormItem phone;
  final BlocFormItem password;
  final BlocFormItem confirmPassword;
  final GlobalKey<FormState>? formkey;

  const RegisterState({
    this.name = const BlocFormItem(error: 'ingresa el nombre completo'),
    this.email = const BlocFormItem(error: 'ingresa el email'),
    this.phone = const BlocFormItem(error: 'ingresa el Telefono'),
    this.password = const BlocFormItem(error: 'ingresa la contraseña'),
    this.confirmPassword = const BlocFormItem(error: 'confirma la contraseña'),
    this.formkey,
  });

  RegisterState copyWith(
      {BlocFormItem? name,
      BlocFormItem? email,
      BlocFormItem? phone,
      BlocFormItem? password,
      BlocFormItem? confirmPassword,
      GlobalKey<FormState>? formkey}) {
    return RegisterState(
        name: name ?? this.name,
        email: email ?? this.email,
        phone: name ?? this.phone,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        formkey: formkey);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, phone, password, confirmPassword];
}
