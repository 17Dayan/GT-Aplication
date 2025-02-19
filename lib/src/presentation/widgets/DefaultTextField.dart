import 'package:flutter/material.dart';

class Defaulttextfield extends StatelessWidget {
  String text;
  IconData icon;

  Defaulttextfield({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email, color: Colors.black),
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
