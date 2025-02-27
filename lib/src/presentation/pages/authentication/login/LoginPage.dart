import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/login/LoginContent.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/login/bloc/LoginBloc.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/login/bloc/LoginState.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<LoginBloc, Loginstate>(
      builder: (context, state) {
        return Logincontent(state);
      },
    ));
  }
}
