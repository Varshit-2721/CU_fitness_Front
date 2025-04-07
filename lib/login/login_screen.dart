import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cu_fitness/common_widgets/myButton.dart';
import 'package:dio/dio.dart';
import '../common_widgets/my_elevated_button.dart';
import '../homepage/home_page.dart';
import '../register/register_screen_1.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Dio _dio = Dio();

  Future<void> _login() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    try {
      final response = await _dio.post(
        'http://127.0.0.1:8000/api/users/login/',
        data: {
          'username': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Navigate to HomePage on success
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      } else {
        _showError('Invalid credentials');
      }
    } catch (e) {
      _showError('Login failed. Please try again.');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
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
            // Body
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
                  SizedBox(width: 200),
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
                                fontSize: 30, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          controller: _emailController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Username',
                            // hintText: 'Email',
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 15, color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextField(
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
                            onTap: _login,
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
                                    builder: (context) => RegisterScreen1()));
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
