import 'package:flutter/material.dart';
import 'package:gtmensajeria/src/presentation/widgets/DefaultButton.dart';
import 'package:gtmensajeria/src/presentation/widgets/DefaultTextField.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          child: Column(
            children: [
              _imageBanner(),
              Defaulttextfield(
                text: 'Nombre',
                icon: Icons.person_outline,
                margin: EdgeInsets.only(left: 10, right: 10, top: 5),
              ),
              Defaulttextfield(
                text: 'E-mail',
                icon: Icons.email_outlined,
                margin: EdgeInsets.only(left: 10, right: 10, top: 1),
              ),
              Defaulttextfield(
                text: 'Telefono',
                icon: Icons.phone_outlined,
                margin: EdgeInsets.only(left: 10, right: 10, top: 1),
              ),
              Defaulttextfield(
                text: 'Contraseña',
                icon: Icons.lock_outline,
                margin: EdgeInsets.only(left: 10, right: 10, top: 1),
              ),
              Defaulttextfield(
                text: 'Confirmar Contraseña',
                icon: Icons.lock_outline,
                margin: EdgeInsets.only(left: 10, right: 10, top: 1),
              ),
              Defaultbutton(
                text: 'Crear Usuario',
                margin: EdgeInsets.only(top: 10, left: 10, right: 30),
              ),
              _textIAlReadyHaveAccount(context)
            ],
          ),
        )
      ],
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
        quarterTurns: 1,
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
