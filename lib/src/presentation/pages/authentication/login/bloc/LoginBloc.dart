import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/login/bloc/LoginEvent.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/login/bloc/LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, Loginstate> {
  final formKey = GlobalKey<FormState>();

  LoginBloc() : super(Loginstate()) {
    on<LoginInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email, formKey: formKey));
    });
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password, formKey: formKey));
    });
    on<FormSubmit>((event, emit) {
      print('Email: ${state.email}');
      print('Contraseña: ${state.password}');
    });
  }
}
