import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 80, //bar height
              width: double.infinity,
              color: Colors.black,
              padding: EdgeInsets.only(right: 30),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    color: Colors.black,
                    height: 80,
                    width: 100,
                    child: Image.asset('assets/logo.png'),
                  ),
                  //Body started
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
