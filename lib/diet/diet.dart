import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

import '../common_widgets/color_changing_button.dart';

class DietPage extends StatelessWidget {
  const DietPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 212, 107),
        body: SingleChildScrollView(
          child: Column(children: [
            // Top Navigation Bar
            Container(
              height: 80, // Bar height
              width: double.infinity,
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo (Left-Aligned)
                  Container(
                    color: Colors.black,
                    height: 80,
                    width: 100,
                    child: Image.asset('assets/logo.png'),
                  ),
                  Spacer(), // Pushes buttons to the center
                  // Navigation Buttons (Centered)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ColorChangingButton(
                        initialColor: Colors.transparent,
                        finalColor: const Color.fromARGB(255, 104, 104, 104),
                        initialText: 'Fitness',
                        finalText: 'Fitness',
                      ),
                      SizedBox(width: 30),
                      ColorChangingButton(
                        initialColor: Colors.transparent,
                        finalColor: Color.fromARGB(255, 104, 104, 104),
                        initialText: 'Diet',
                        finalText: 'Diet',
                      ),
                      SizedBox(width: 30),
                      ColorChangingButton(
                        initialColor: Colors.transparent,
                        finalColor: Color.fromARGB(255, 104, 104, 104),
                        initialText: 'Progress',
                        finalText: 'Progress',
                      ),
                      SizedBox(width: 30),
                      ColorChangingButton(
                        initialColor: Colors.transparent,
                        finalColor: Color.fromARGB(255, 104, 104, 104),
                        initialText: 'Community',
                        finalText: 'Community',
                      ),
                    ],
                  ),
                  Spacer(), // Ensures the buttons are centered
                ],
              ),
            ),

            // Main Content Area
            Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      height: 700,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ]),
        ));
  }
}
