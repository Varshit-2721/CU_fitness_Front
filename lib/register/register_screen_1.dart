import 'package:cu_fitness/register/register_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cu_fitness/common_widgets/myButton.dart';
import '../common_widgets/my_elevated_button.dart';
import '../login/login_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterScreen1 extends StatefulWidget {
  const RegisterScreen1({super.key});

  @override
  RegisterScreen1State createState() => RegisterScreen1State();
}

class RegisterScreen1State extends State<RegisterScreen1> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // For validation

  Future<void> registerUser() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    final String password2 = _password2Controller.text.trim();

    if (password != password2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match!"),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final response = await http.post(
      Uri.parse("http://127.0.0.1:8000/api/register/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": email.split('@')[0], // Use email prefix as username
        "email": email,
        "password": password,
        "password2": password2,
      }),
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration successful!")),
      );
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => RegisterScreen2()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration failed: ${response.body}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navigation Bar
            Container(
              height: 80,
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

            // Body - Registration Form
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 20, 20),
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 50)),
                  Container(
                    height: 650,
                    width: 835,
                    child: Image.asset("assets/p3.png"),
                  ),
                  const SizedBox(width: 50),

                  // Register Box
                  Container(
                    height: 550,
                    width: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(233, 26, 26, 26),
                    ),
                    padding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Register to join us...!',
                              style: GoogleFonts.poppins(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller:
                                _emailController, //change to username controller
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Username',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 15, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Email',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 15, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Password',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 15, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: _password2Controller,
                            obscureText: true,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Re-enter Password',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 15, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Center(
                            child: MyElevatedButton(
                              buttonText: 'Register',
                              buttonColor: Colors.blue,
                              onTap: registerUser,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already registered?',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.white),
                              ),
                              const SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ));
                                },
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
