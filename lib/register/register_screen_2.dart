import 'package:cu_fitness/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cu_fitness/common_widgets/myButton.dart';
import 'package:dio/dio.dart';
import '../common_widgets/my_elevated_button.dart';

class RegisterScreen2 extends StatefulWidget {
  const RegisterScreen2({super.key});

  @override
  RegisterScreen2State createState() => RegisterScreen2State();
}

class RegisterScreen2State extends State<RegisterScreen2> {
  String? selectedGender;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final Dio _dio = Dio();

  Future<void> _submitUserProfile() async {
    final String name = _nameController.text;
    final String age = _ageController.text;
    final String height = _heightController.text;
    final String weight = _weightController.text;

    // Input validation
    if (name.isEmpty ||
        age.isEmpty ||
        height.isEmpty ||
        weight.isEmpty ||
        selectedGender == null) {
      _showError('Please fill in all fields');
      return;
    }

    // Validate numeric inputs
    if (double.tryParse(age) == null ||
        double.tryParse(height) == null ||
        double.tryParse(weight) == null) {
      _showError('Age, height, and weight must be numbers');
      return;
    }

    try {
      final response = await _dio.post(
        'http://127.0.0.1:8000/api/profile/',
        data: {
          'name': name,
          'age': int.parse(age),
          'gender': selectedGender,
          'height': double.parse(height),
          'weight': double.parse(weight),
        },
      );

      if (response.statusCode == 201) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
      } else {
        _showError(response.data['message'] ??
            'Failed to submit profile. Please try again.');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // Server responded with an error
        _showError(e.response?.data['message'] ??
            'Error submitting profile. Please try again.');
      } else if (e.type == DioExceptionType.connectionTimeout) {
        _showError(
            'Connection timeout. Please check your internet connection.');
      } else {
        _showError(
            'Network error. Please check your connection and try again.');
      }
    } catch (e) {
      _showError('An unexpected error occurred. Please try again.');
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
                  const Spacer(),
                  MyButton(
                    buttonText: 'Back',
                    width: 100,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
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
                            "Let's go...!",
                            style: GoogleFonts.poppins(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          controller: _nameController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Full Name',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _ageController,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Age',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: selectedGender,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Gender',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                items: ['Male', 'Female', 'Other']
                                    .map((gender) => DropdownMenuItem(
                                          value: gender,
                                          child: Text(
                                            gender,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _heightController,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Height',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: TextField(
                                controller: _weightController,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Weight',
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Center(
                          child: MyElevatedButton(
                            buttonText: 'Get Started',
                            buttonColor: Colors.blue,
                            onTap: _submitUserProfile,
                          ),
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
