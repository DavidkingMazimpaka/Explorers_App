// import 'package:flutter/material.dart';

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:
//           const Color(0xFF3B4948), // Match the background color to your theme
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(32.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: MediaQuery.of(context).size.height * 0.1),
//               Image.asset(
//                 'explorer.png', // Replace with your asset path for the logo
//                 height: 120, // Adjust the size to fit your design
//               ),
//               const SizedBox(height: 48), // Space between the logo and the form
//               const Text(
//                 'Sign Up',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(
//                   height: 48), // Space between the title and the form fields
//               _buildTextField(
//                 label: 'Username',
//                 hint: 'Enter username...',
//               ),
//               const SizedBox(height: 16), // Space between the text fields
//               _buildTextField(
//                 label: 'Email',
//                 hint: 'Enter email...',
//               ),
//               const SizedBox(height: 16), // Space between the text fields
//               _buildTextField(
//                 label: 'Password',
//                 hint: 'Enter password...',
//                 isPassword: true,
//               ),
//               const SizedBox(
//                   height:
//                       32), // Space between the last text field and the button
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.black,
//                   backgroundColor: Colors.white, // Text color
//                   minimumSize: const Size(double.infinity, 50), // Button size
//                 ),
//                 onPressed: () {
//                   // TODO: Implement sign-up logic
//                 },
//                 child: const Text('SIGN UP'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//       {required String label, required String hint, bool isPassword = false}) {
//     return TextField(
//       decoration: InputDecoration(
//         labelText: label,
//         hintText: hint,
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide.none,
//         ),
//       ),
//       obscureText: isPassword, // Hide text if it's for the password field
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore package
import '../../models/user_model.dart'; // Import UserModel class

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  const SignUpScreen({Key? key}) : super(key: key);

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
                'explorer.png',
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
                onPressed: _registerUser, // Call the register user function
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

  void _registerUser() async {
    String email = _emailController.text.trim();
    String fullName = _fullNameController.text.trim();
    String username = _usernameController.text.trim();
    String location = _locationController.text.trim();

    if (email.isEmpty || fullName.isEmpty || username.isEmpty || location.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields.'),
        ),
      );
      return;
    }

    UserModel newUser = UserModel(
      id: '', // Generate a unique ID for the user, or leave it empty if Firestore generates it automatically
      email: email,
      fullName: fullName,
      username: username,
      location: location,
    );

    try {
      await FirebaseFirestore.instance.collection('users').add(newUser.toMap());

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
      print(error);
    }
  }
}
