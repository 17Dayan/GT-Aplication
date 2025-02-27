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
  LoginBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(body: BlocBuilder<LoginBloc, Loginstate>(
      builder: (context, state) {
        return Logincontent(_bloc);
      },
    ));
  }
}
