import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/login/LoginPage.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/login/bloc/LoginBloc.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/login/bloc/LoginEvent.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/register/RegisterPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc()..add(LoginInitEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginPage(),
          '/registro': (context) =>
              RegisterPage(), // Asegúrate de que el nombre de la clase es correcto
        },
      ),
    );
  }
}
