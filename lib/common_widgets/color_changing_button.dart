import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorChangingButton extends StatefulWidget {
  final Color initialColor; // The initial color when the button is rendered
  final Color finalColor; // The final color after the button is pressed
  final String initialText; // The initial text when the button is rendered
  final String finalText; // The text to display after the button is pressed

  const ColorChangingButton({
    super.key,
    this.initialColor = Colors.transparent, // Default to transparent
    required this.finalColor, // The final color is required
    this.initialText = 'Press me!', // Default initial text
    required this.finalText, // The final text is required
  });

  @override
  ColorChangingButtonState createState() => ColorChangingButtonState();
}

class ColorChangingButtonState extends State<ColorChangingButton> {
  late Color _buttonColor;
  late String _buttonText;

  @override
  void initState() {
    super.initState();
    // Initialize the button color and text with initial values
    _buttonColor = widget.initialColor;
    _buttonText = widget.initialText;
  }

  // Function to change both button color and text to final values
  void _changeToFinalState() {
    setState(() {
      _buttonColor = widget.finalColor;
      _buttonText = widget.finalText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: _changeToFinalState,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(_buttonColor),
        ),
        child: Text(
          _buttonText,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ));
  }
}
