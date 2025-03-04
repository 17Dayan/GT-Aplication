import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaulttextfieldOutlined extends StatelessWidget {
  String text;
  Function(String text) onChanged;
  IconData icon;
  EdgeInsets margin;
  String? Function(String?)? validator;

  DefaulttextfieldOutlined(
      {required this.text,
      required this.icon,
      required this.onChanged,
      required this.margin,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.all(10), // 📌 Espaciado interno
      decoration: BoxDecoration(
        // 📌 Color de fondo del Container
        color: Color.fromRGBO(255, 255, 255, 0.2),
        borderRadius: BorderRadius.circular(20), // 📌 Bordes redondeados
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8, // 📌 Ancho ajustado
        child: Column(
          children: [
            TextFormField(
              onChanged: (text) {
                onChanged(text);
              },
              validator: validator,
              decoration: InputDecoration(
                labelText: text,
                prefixIcon: Icon(icon, color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                // border: OutlineInputBorder(
                //  borderRadius: BorderRadius.circular(15),
                //   borderSide: BorderSide.none,
                // ),

                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 116, 176, 206),
                        width: 1)),

                labelStyle: TextStyle(color: Colors.grey),
              ),
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 20),
            // 📌 Espacio entre los campos
          ],
        ),
      ),
    );
  }
}
