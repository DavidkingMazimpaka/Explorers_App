import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF3B4948), // Match the background color to your theme
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Image.asset(
                'explorer.png', // Replace with your asset path for the logo
                height: 120, // Adjust the size to fit your design
              ),
              const SizedBox(height: 48), // Space between the logo and the form
              const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                  height: 48), // Space between the title and the form fields
              _buildTextField(
                label: 'Username',
                hint: 'Enter username...',
              ),
              const SizedBox(height: 16), // Space between the text fields
              _buildTextField(
                label: 'Email',
                hint: 'Enter email...',
              ),
              const SizedBox(height: 16), // Space between the text fields
              _buildTextField(
                label: 'Password',
                hint: 'Enter password...',
                isPassword: true,
              ),
              const SizedBox(
                  height:
                      32), // Space between the last text field and the button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white, // Text color
                  minimumSize: const Size(double.infinity, 50), // Button size
                ),
                onPressed: () {
                  // TODO: Implement sign-up logic
                },
                child: const Text('SIGN UP'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String label, required String hint, bool isPassword = false}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: isPassword, // Hide text if it's for the password field
    );
  }
}
