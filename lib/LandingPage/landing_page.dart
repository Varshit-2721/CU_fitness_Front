import 'package:cu_fitness/chatbot/chatbot.dart';
import 'package:cu_fitness/common_widgets/myButton.dart';
import 'package:cu_fitness/homepage/home_page.dart';
// import 'package:cu_fitness/homepage/home_page.dart';
import 'package:cu_fitness/login/login_screen.dart';
import 'package:cu_fitness/register/register_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../profile_page/profile_page.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 80, //bar height
                  width: double.infinity,
                  color: Colors.black,
                  padding: EdgeInsets.only(right: 30),
                  child: Row(children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      color: Colors.black,
                      height: 80,
                      width: 100,
                      child: Image.asset('assets/logo.png'),
                    ),
                    SizedBox(
                      width: 600,
                    ), // logo Container
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Home',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              'Services',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              'Contact us',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                              },
                              child: Text(
                                'Login',
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            MyButton(
                              buttonText: 'Register',
                              width: 100,
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return RegisterScreen1();
                                }));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ])),
//top bar completed

//Body started
              Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 700,
                        color: Colors.black,
                        padding: EdgeInsets.fromLTRB(50, 50, 120, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Welcome To CU Fitness',
                                style: GoogleFonts.poppins(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                            SizedBox(
                              height: 5,
                            ),
                            Text('– Your Journey Starts Here!',
                                style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                                'Ready to transform your health, build strength, and feel your best? At CU Fitness, we’re here to help you reach your goals with expert guidance, tailored workouts, and a supportive community. Whether you’re a beginner or a seasoned athlete, we have everything you need to succeed—workout programs, nutrition tips, and motivation to keep you going. Join us today and take the first step toward a stronger, healthier you! Let’s move, sweat, and thrive—together! ',
                                style: GoogleFonts.poppins(
                                    fontSize: 18, color: Colors.white)),
                            SizedBox(
                              height: 25,
                            ),
                            MyButton(
                              buttonText: 'Get started',
                              width: 130,
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Expanded(
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        height: 700,
                        child: Stack(
                          //stack
                          children: [
                            Container(
                              height: 700,
                              color: Colors.black,
                            ),
                            Positioned(
                              top: 75,
                              left: 33,
                              child: Container(
                                  height: 475,
                                  width: 120,
                                  color: Colors.black,
                                  child: Image.asset('assets/font.png')),
                            ),
                            Positioned(
                              top: 10,
                              right: 1,
                              // ignore: sized_box_for_whitespace
                              child: Container(
                                  height: 600,
                                  width: 400,
                                  //  color: Colors.red,
                                  child: Image.asset('assets/p.png')),
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
        ));
  }
}
