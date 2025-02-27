import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/login/bloc/LoginEvent.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/login/bloc/LoginState.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/utils/BlocFormItem.dart';

class LoginBloc extends Bloc<LoginEvent, Loginstate> {
  final formKey = GlobalKey<FormState>();

  LoginBloc() : super(Loginstate()) {
    on<LoginInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
          email: BlocFormItem(
              value: event.email.value,
              error: event.email.value.isEmpty ? 'Ingresa el email' : null),
          formKey: formKey));
    });
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
          password: BlocFormItem(
              value: event.password.value,
              error: event.password.value.isEmpty
                  ? 'Ingrese la contraseña'
                  : event.password.value.length < 6
                      ? 'Minimo 6 caracteres'
                      : null),
          formKey: formKey));
    });
    on<FormSubmit>((event, emit) {
      print('Email: ${state.email.value}');
      print('Contraseña: ${state.password.value}');
    });
  }
}
