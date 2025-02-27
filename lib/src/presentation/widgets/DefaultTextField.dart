import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Defaulttextfield extends StatelessWidget {
  String text;
  Function(String text) onChanged;
  IconData icon;
  EdgeInsets margin;
  String? Function(String?)? validator;

  Defaulttextfield(
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
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
