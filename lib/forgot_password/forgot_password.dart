import 'package:flutter/material.dart';
import 'package:cu_fitness/common_widgets/myButton.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navigation Bar
            Container(
              height: 80, // Bar height
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  SizedBox(
                    height: 80,
                    width: 100,
                    child: Image.asset('assets/logo.png'),
                  ),
                  const SizedBox(width: 1250),
                  MyButton(
                    buttonText: 'Back',
                    width: 100,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
