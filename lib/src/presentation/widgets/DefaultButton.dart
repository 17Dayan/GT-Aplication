import 'package:flutter/material.dart';

class Defaultbutton extends StatelessWidget {
  String text;

  Defaultbutton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
