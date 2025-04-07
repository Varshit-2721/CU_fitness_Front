import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../login/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // User profile data
  Map<String, String> userData = {
    'username': 'fit_guru_21',
    'email': 'fitguru@example.com',
    'age': '25',
    'gender': 'Male',
    'height': '175 cm',
    'weight': '70 kg',
  };

  @override
  Widget build(BuildContext context) {
    // Dark theme colors
    final backgroundColor = Colors.black;
    final cardColor = const Color(0xFF121212);
    final textColor = Colors.white;
    final secondaryTextColor = Colors.white70;
    final dividerColor = Colors.white12;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () {
            // Navigate to login page and clear navigation stack
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
              (route) => false, // This removes all previous routes
            );
          },
        ),
        title: Row(
          children: [
            SizedBox(
              height: 40,
              child: Image.asset('assets/logo.png'),
            ),
          ],
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Profile avatar
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage("assets/p3.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  userData['username']!,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                Text(
                  userData['email']!,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: secondaryTextColor,
                  ),
                ),
                const SizedBox(height: 40),
                // Profile information cards
                _profileInfoSection(context, cardColor, textColor,
                    secondaryTextColor, dividerColor),
                const SizedBox(height: 40),
                // Edit profile button
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      _showEditProfileDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'Edit Profile',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    // Create a temporary map to store changes
    Map<String, String> tempUserData = Map.from(userData);

    // Create controllers for each field
    final usernameController =
        TextEditingController(text: userData['username']);
    final emailController = TextEditingController(text: userData['email']);
    final ageController = TextEditingController(text: userData['age']);
    final genderController = TextEditingController(text: userData['gender']);
    final heightController = TextEditingController(text: userData['height']);
    final weightController = TextEditingController(text: userData['weight']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF121212),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Edit Profile',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildDialogTextField('Username', usernameController),
                        const SizedBox(height: 16),
                        _buildDialogTextField('Email', emailController),
                        const SizedBox(height: 16),
                        _buildDialogTextField('Age', ageController),
                        const SizedBox(height: 16),
                        _buildDialogTextField('Gender', genderController),
                        const SizedBox(height: 16),
                        _buildDialogTextField('Height', heightController),
                        const SizedBox(height: 16),
                        _buildDialogTextField('Weight', weightController),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white70,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Update user data
                          setState(() {
                            userData['username'] = usernameController.text;
                            userData['email'] = emailController.text;
                            userData['age'] = ageController.text;
                            userData['gender'] = genderController.text;
                            userData['height'] = heightController.text;
                            userData['weight'] = weightController.text;
                          });
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text(
                          'Save',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDialogTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            controller: controller,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white38),
            ),
          ),
        ),
      ],
    );
  }

  Widget _profileInfoSection(BuildContext context, Color cardColor,
      Color textColor, Color secondaryTextColor, Color dividerColor) {
    final infoItems = [
      {'label': 'Age', 'value': userData['age']!},
      {'label': 'Gender', 'value': userData['gender']!},
      {'label': 'Height', 'value': userData['height']!},
      {'label': 'Weight', 'value': userData['weight']!},
    ];

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.05),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: infoItems.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              thickness: 1,
              color: dividerColor,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      infoItems[index]['label']!,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: secondaryTextColor,
                      ),
                    ),
                    Text(
                      infoItems[index]['value']!,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
