import 'package:flutter/material.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/login/bloc/LoginBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/login/bloc/LoginEvent.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/login/bloc/LoginState.dart';
import 'package:gtmensajeria/src/presentation/pages/authentication/utils/BlocFormItem.dart';
import 'package:gtmensajeria/src/presentation/widgets/DefaultButton.dart';
import 'package:gtmensajeria/src/presentation/widgets/DefaultTextField.dart';

class Logincontent extends StatelessWidget {
  final Loginstate state;

  Logincontent(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          // ✅ Imagen de fondo que cubre toda la pantalla excepto el lado azul
          Positioned.fill(
            child: Image.asset(
              'assets/img/bg2.jpeg', // 📌 Asegúrate de que la imagen está en la carpeta correcta
              fit: BoxFit.cover,
            ),
          ),

          // ✅ Fondo azul SOLO en el lado izquierdo
          Positioned(
            left: 0,
            width: MediaQuery.of(context).size.width *
                0.15, // 🔵 Solo el 15% de la pantalla
            height: MediaQuery.of(context).size.height,
            child: Container(
              color: Color(0xFF68CEF6),
            ),
          ),

          // ✅ Texto vertical "Log In | Registrarse"
          // ✅ Texto vertical "Log In | Registrarse" alineados juntos
          // ✅ Texto vertical "Log In | Registrarse" con cada uno en su propio RotatedBox
          // ✅ Texto vertical "Log In | Registrarse" con cada uno en su propio RotatedBox
          // ✅ Texto vertical "Log In | Registrarse" con cada uno en su propio RotatedBox
          Positioned(
            left: MediaQuery.of(context).size.width *
                0.040, // 📌 Centra en el fondo azul (15% / 2)
            top: MediaQuery.of(context).size.height *
                0.4, // 📌 Ajusta según la altura que prefieras
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment:
                  MainAxisAlignment.center, // 📌 Centrado vertical
              children: [
                _textLoginRotated(),
                SizedBox(height: 20), // 📌 Espacio entre "Login" y "Registro"
                _textRegisterRotated(context),
              ],
            ),
          ),

          // ✅ Contenido del formulario flotando sobre la imagen
          Positioned(
            left: MediaQuery.of(context).size.width * 0.2,
            top: MediaQuery.of(context).size.height *
                0.1, // 📌 Se subió más el texto
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Fila con "Bienvenidos GT Mensajería" y el logo a la derecha
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // ✅ Texto "Bienvenidos GT Mensajería"
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _textWelcome('Bienvenidos'),
                        _textWelcome('GT Mensajeria'),
                      ],
                    ),
                    const SizedBox(width: 10), // 📌 Espacio entre texto y logo

                    // ✅ Logo alineado a la derecha del texto
                    _imageLogo(),
                  ],
                ),

                const SizedBox(height: 50),

                // 📌 Se agregó más espacio entre "Ingresar" y los campos de entrada
                const SizedBox(height: 80),

                // ✅ Campos de entrada más anchos
                SizedBox(
                  width:
                      MediaQuery.of(context).size.width * 0.7, // 📌 Más ancho
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Defaulttextfield(
                            onChanged: (text) {
                              context.read<LoginBloc>().add(EmailChanged(
                                  email: BlocFormItem(value: text)));
                            },
                            validator: (value) {
                              return state.email.error;
                            },
                            text: 'Email',
                            icon: Icons.email_outlined,
                            margin: EdgeInsets.all(2.0)),
                        const SizedBox(
                            height: 20), // 📌 Más espacio entre los campos
                        TextFormField(
                          onChanged: (text) {
                            context.read<LoginBloc>().add(PasswordChanged(
                                password: BlocFormItem(value: text)));
                          },
                          validator: (value) {
                            return state.password.error;
                          },
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            prefixIcon: Icon(Icons.lock, color: Colors.black),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            labelStyle: TextStyle(color: Colors.grey),
                          ),
                          obscureText: true,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),

                // 📌 Más espacio antes del botón
                const SizedBox(height: 40),

                // ✅ Botón de inicio de sesión más grande
                Defaultbutton(
                  text: 'Iniciar Sesion',
                  onPressed: () {
                    if (state.formKey!.currentState!.validate()) {
                      context.read<LoginBloc>().add(FormSubmit());
                    } else {
                      print('El formulario no es valido');
                    }
                  },
                ),
                _textDontHaveAccount(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textDontHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No tienes cuenta?',
          style: TextStyle(color: Colors.grey[500], fontSize: 17),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/registro');
          },
          child: Text(
            'Registrate ahora',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        )
      ],
    );
  }

  Widget _imageLogo() {
    return Image.asset(
      'assets/img/LOGOGT.png', // 📌 Cambia la ruta si es necesario
      width: 90, // 📌 Ajusta el tamaño del logo
      height: 90,
    );
  }

  Widget _textWelcome(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _textRegisterRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/registro');
      },
      child: RotatedBox(
        quarterTurns: -1, // Gira "Registro" en vertical
        child: Text(
          'Registro',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
          ),
        ),
      ),
    );
  }

  Widget _textLoginRotated() {
    return RotatedBox(
      quarterTurns: -1, // Gira "Login" en vertical
      child: Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
