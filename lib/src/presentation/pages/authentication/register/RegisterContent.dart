import 'package:flutter/material.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/utils/BlocFormItem.dart';
import 'package:provider/provider.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/register/bloc/RegisterBloc.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/register/bloc/RegisterEvent.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/register/bloc/RegisterState.dart';
import 'package:gtmensajeria/src/presentation/widgets/DefaultButton.dart';
import 'package:gtmensajeria/src/presentation/widgets/DefaultTextFieldOutlined.dart';

class RegisterContent extends StatelessWidget {
  final RegisterState state;

  RegisterContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formkey,
      child: Stack(
        alignment: Alignment.center, // Asegura que no bloquee eventos
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF68CEF6), // Light Blue
                Color(0xFF007AFF), // Darker Blue for a gradient effect
              ],
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textLoginRotated(context),
                SizedBox(height: 100),
                _textRegisterRotated(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 60, bottom: 35),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    bottomLeft: Radius.circular(35)),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFFEEEEEE), // Gris claro
                      Color.fromARGB(255, 240, 237, 237), // Gris medio
                    ])),
            child: Stack(
              children: [
                _imageBackground(context),
                SingleChildScrollView(
                  physics:
                      NeverScrollableScrollPhysics(), // Evita bloqueo de eventos táctiles
                  child: Column(
                    children: [
                      _imageBanner(),
                      DefaulttextfieldOutlined(
                        text: 'Nombre',
                        icon: Icons.person_outline,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              NameChanged(name: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.name.error;
                        },
                      ),
                      DefaulttextfieldOutlined(
                        text: 'E-mail',
                        icon: Icons.email_outlined,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 1),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              EmailChanged(email: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.email.error;
                        },
                      ),
                      DefaulttextfieldOutlined(
                        text: 'Telefono',
                        icon: Icons.phone_outlined,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 1),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              PhoneChanged(phone: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.phone.error;
                        },
                      ),
                      DefaulttextfieldOutlined(
                        text: 'Contraseña',
                        icon: Icons.lock_outline,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 1),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(PasswordChanged(
                              password: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.password.error;
                        },
                      ),
                      DefaulttextfieldOutlined(
                        text: 'Confirmar Contraseña',
                        icon: Icons.lock_outline,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 1),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              ConfirmPasswordChanged(
                                  confirmPassword: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.confirmPassword.error;
                        },
                      ),
                      Defaultbutton(
                        onPressed: () {
                          if (state.formkey!.currentState!.validate()) {
                            context.read<RegisterBloc>().add(FormSubmit());
                            context.read<RegisterBloc>().add(FormReset());
                          }
                        },
                        text: 'Crear Usuario',
                        margin: EdgeInsets.only(top: 10, left: 10, right: 30),
                      ),
                      _textIAlReadyHaveAccount(context)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 60),
      child: Image.asset(
        'assets/img/bg1.jpeg',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
        opacity: AlwaysStoppedAnimation(0.2),
      ),
    );
  }

  Widget _textIAlReadyHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ya tienes cuenta?',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(width: 5),
        GestureDetector(
          behavior: HitTestBehavior.translucent, // Permite detectar el toque
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Text(
            'Inicia Sesion',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _imageBanner() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/LOGOGT.png',
        width: 200,
        height: 200,
      ),
    );
  }

  Widget _textRegisterRotated() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Registro',
        style: TextStyle(
          fontSize: 27,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _textLoginRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/login');
      },
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
