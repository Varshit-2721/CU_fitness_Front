import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cu_fitness/common_widgets/myButton.dart';
import '../common_widgets/my_elevated_button.dart';
import '../homepage/home_page.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            // Login Form
            Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 150)),
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 650,
                      width: 494,
                      child: Image.asset("assets/p2.png"),
                    ),
                    //image container ended
                    // login box started
                    SizedBox(
                      width: 200,
                    ),
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
                              'Welcome Back !',
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
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forgot password ?',
                                style: GoogleFonts.poppins(
                                    fontSize: 13, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Center(
                            child: MyElevatedButton(
                              buttonText: 'Login',
                              buttonColor: Colors.blue,
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }));
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Haven\'t registered yet?',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.white)),
                              const SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                                },
                                child: Text('Register',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                    )),
                              ),
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
