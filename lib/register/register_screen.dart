import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cu_fitness/common_widgets/myButton.dart';

import '../LandingPage/landing_page.dart';
import '../common_widgets/my_elevated_button.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
//top bar completed
            //         const SizedBox(height: 100),
//body started
            // Register Form

            Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 20, 20),
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 50)),
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 650,
                      width: 835,
                      //color: Colors.white,
                      child: Image.asset("assets/p3.png"),
                    ),
                    //image container ended
                    // login box started
                    Container(
                      height: 500,
                      width: 450,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(233, 26, 26, 26),
                      ),
                      padding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Register to join us...!',
                              style: GoogleFonts.poppins(
                                  fontSize: 30,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextField(
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              hintText: 'Email',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextField(
                            obscureText: true,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              hintText: 'Password',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextField(
                            obscureText: true,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              hintText: 'Re enter Password',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Center(
                            child: MyElevatedButton(
                              buttonText: 'Register',
                              buttonColor: Colors.blue,
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Landingpage();
                                }));
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already registered ?',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.white)),
                              const SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                                },
                                child: Text('Login',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
