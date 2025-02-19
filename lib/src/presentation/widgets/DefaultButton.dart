import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Defaultbutton extends StatelessWidget {
  String text;
  EdgeInsetsGeometry margin;

  Defaultbutton({
    required this.text,
    this.margin = const EdgeInsets.only(bottom: 20, left: 40, right: 40),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFFF585), // ✅ Color azul original
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
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
