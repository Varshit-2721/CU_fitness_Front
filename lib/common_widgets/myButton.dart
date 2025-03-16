// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final double width;
  const MyButton({
    super.key,
    required this.buttonText,
    required this.width,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: width,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white, width: 1.5),
          //  text: 'login',style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
        ),
        child: Center(
          child: Text(
            buttonText,
            style: GoogleFonts.poppins(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
