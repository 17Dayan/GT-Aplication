import 'package:flutter/material.dart';

class Logincontent extends StatelessWidget {
  const Logincontent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Positioned(
          left: 10,
          top: MediaQuery.of(context).size.height * 0.3,
          child: RotatedBox(
            quarterTurns: -1, // Gira el texto en vertical
            child: Row(
              // 🔹 Cambia a Row para poner "Login" y "Registro" en línea
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(
                    width: 30), // 🔹 Espacio entre el separador y "Registro"
                Text(
                  'Registro',
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
              ],
            ),
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
                    children: const [
                      Text(
                        'Bienvenidos',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'GT Mensajería',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10), // 📌 Espacio entre texto y logo

                  // ✅ Logo alineado a la derecha del texto
                  Image.asset(
                    'assets/img/LOGOGT.png', // 📌 Cambia la ruta si es necesario
                    width: 90, // 📌 Ajusta el tamaño del logo
                    height: 90,
                  ),
                ],
              ),

              const SizedBox(height: 50),

              // 📌 Se agregó más espacio entre "Ingresar" y los campos de entrada
              const SizedBox(height: 80),

              // ✅ Campos de entrada más anchos
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7, // 📌 Más ancho
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Correo',
                        prefixIcon: Icon(Icons.email, color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                        height: 20), // 📌 Más espacio entre los campos
                    TextFormField(
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
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),

              // 📌 Más espacio antes del botón
              const SizedBox(height: 60),

              // ✅ Botón de inicio de sesión más grande
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFF585), // ✅ Color azul original
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
