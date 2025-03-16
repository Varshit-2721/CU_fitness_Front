import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyElevatedButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onTap; // Added onTap callback

  const MyElevatedButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.onTap, // Required parameter
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, // Calls the provided function when tapped
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
      child: Text(
        buttonText,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
