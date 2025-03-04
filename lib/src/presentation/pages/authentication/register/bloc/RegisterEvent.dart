import 'package:gtmensajeria/src/presentation/pages/authentication/utils/BlocFormItem.dart';

abstract class Registerevent {}

class RegisterInitEvent extends Registerevent {}

class NameChanged extends RegisterInitEvent {
  final BlocFormItem name;
  NameChanged({required this.name});
}

class EmailChanged extends RegisterInitEvent {
  final BlocFormItem email;
  EmailChanged({required this.email});
}

class PhoneChanged extends RegisterInitEvent {
  final BlocFormItem phone;
  PhoneChanged({required this.phone});
}

class PasswordChanged extends RegisterInitEvent {
  final BlocFormItem password;
  PasswordChanged({required this.password});
}

class ConfirmPasswordChanged extends RegisterInitEvent {
  final BlocFormItem confirmPassword;
  ConfirmPasswordChanged({required this.confirmPassword});
}

class FormSubmit extends RegisterInitEvent {}

class FormReset extends RegisterInitEvent {}
