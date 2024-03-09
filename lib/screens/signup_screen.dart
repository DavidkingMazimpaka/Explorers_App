// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, avoid_print

/*
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Ensure Firestore is imported
import '../../models/Users.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3B4948),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Image.asset(
                'explorer.png', // Ensure the image asset exists or adjust the path accordingly
                height: 120,
              ),
              const SizedBox(height: 48),
              const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48),
              _buildTextField(
                label: 'Email',
                hint: 'Enter email...',
                controller: _emailController,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Full Name',
                hint: 'Enter full name...',
                controller: _fullNameController,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Username',
                hint: 'Enter username...',
                controller: _usernameController,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Location',
                hint: 'Enter location...',
                controller: _locationController,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () =>
                    _registerUser(context), // Pass context to the function
                child: const Text('SIGN UP'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
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
    );
  }
  void _registerUser(BuildContext context) async {
    final email = _emailController.text.trim();
    final fullName = _fullNameController.text.trim();
    final username = _usernameController.text.trim();
    final location = _locationController.text.trim();

    if (email.isEmpty ||
        fullName.isEmpty ||
        username.isEmpty ||
        location.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields.'),
        ),
      );
      return;
    }

    try {
      // Assuming UserModel correctly maps to your Firestore collection structure
      final newUser = UserModel(
        email: email,
        fullName: fullName,
        username: username,
        location: location,
        id: '', // Firestore generates this ID when adding a new document
      );

      await FirebaseFirestore.instance.collection('users').add(newUser.toMap());

      // Clear the text fields after successful submission
      _emailController.clear();
      _fullNameController.clear();
      _usernameController.clear();
      _locationController.clear();

      // Optionally, show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sign-up successful. User data added to Firestore.'),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error: Unable to add user data to Firestore.'),
        ),
      );
      print(error); // For debugging purposes
    }
  }
}
*/
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  bool _isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Assuming the user is successfully created
      if (userCredential.user != null) {
        // Optionally, store additional user information in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'fullName': _fullNameController.text.trim(),
          'userName': _userNameController.text.trim(),
          // You can add more fields as needed
        });

        Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Failed to register. Please try again."),
      ));
      print(e); // Ideally, handle the error more gracefully
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3B4948),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Your widgets like Image, TextFields for email, password, fullName, userName and Buttons
              // Assuming you have a method _buildTextField to create text fields
              _buildTextField(
                  controller: _emailController, hint: 'Enter your email'),
              _buildTextField(
                  controller: _passwordController,
                  hint: 'Enter your password',
                  isPassword: true),
              _buildTextField(
                  controller: _fullNameController,
                  hint: 'Enter your full name'),
              _buildTextField(
                  controller: _userNameController, hint: 'Enter your username'),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _registerUser,
                      child: const Text('Sign Up'),
                    ),
              // Optionally, include other UI components as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required String hint,
      bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        obscureText: isPassword,
      ),
    );
  }
}
