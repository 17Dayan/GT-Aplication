import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/register/bloc/RegisterEvent.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/register/bloc/RegisterState.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/utils/BlocFormItem.dart';

class RegisterBloc extends Bloc<Registerevent, RegisterState> {
  final formKey = GlobalKey<FormState>();

  RegisterBloc() : super(RegisterState()) {
    on<RegisterInitEvent>((event, emit) {
      emit(state.copyWith(formkey: formKey));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(
          name: BlocFormItem(
              value: event.name.value,
              error: event.name.value.isEmpty ? 'Ingreda el nombre' : null),
          formkey: formKey));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
          email: BlocFormItem(
              value: event.email.value,
              error: event.email.value.isEmpty ? 'Ingreda el Email' : null),
          formkey: formKey));
    });
    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(
          phone: BlocFormItem(
              value: event.phone.value,
              error: event.phone.value.isEmpty ? 'Ingreda el Telefono' : null),
          formkey: formKey));
    });
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
          password: BlocFormItem(
              value: event.password.value,
              error: event.password.value.isEmpty
                  ? 'Ingreda la Contraseña'
                  : event.password.value.length < 6
                      ? 'Mas de 6 caracteres'
                      : null),
          formkey: formKey));
    });
    on<ConfirmPasswordChanged>((event, emit) {
      emit(state.copyWith(
          confirmPassword: BlocFormItem(
              value: event.confirmPassword.value,
              error: event.confirmPassword.value.isEmpty
                  ? 'Confirma la contrsaeña'
                  : event.confirmPassword.value.length < 6
                      ? 'Mas de 6 caracteres'
                      : event.confirmPassword.value != state.password.value
                          ? 'Las contraseñas no coinciden'
                          : null),
          formkey: formKey));
    });

    on<FormSubmit>((event, emit) {
      print('Name: ${state.name.value}');
      print('Email: ${state.email.value}');
      print('Telefono: ${state.phone.value}');
      print('Contraseña: ${state.password.value}');
      print('Confirmar Contraseña: ${state.password.value}');
    });

    on<FormReset>((event, emit) {
      state.formkey?.currentState?.reset();
    });
  }
}
