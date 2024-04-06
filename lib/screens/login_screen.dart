// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, avoid_print, unused_field, unused_element

/*import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate a login delay
    await Future.delayed(const Duration(seconds: 2));

    // After the "login" is "successful"
    setState(() {
      _isLoading = false;
    });

    // Navigate to the home screen
    Navigator.of(context).pushReplacementNamed('/home');
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
              Image.asset(
                'explorer.png',
                height: 120,
              ),
              const SizedBox(height: 48),
              const Text(
                'Welcome Back! Log In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Column(
                  children: [
                    _buildTextField(
                      controller: _emailController,
                      hint: 'Enter email...',
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _passwordController,
                      hint: 'Enter password...',
                      isPassword: true,
                    ),
                    const SizedBox(height: 32),
                    _isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            onPressed: _login,
                            child: const Text('LOG IN'),
                          ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        "DON'T HAVE AN ACCOUNT YET",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hint,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: isPassword,
      style: const TextStyle(color: Colors.black87),
    );
  }
}*/
/*
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loginWithEmailPassword() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (userCredential.user != null) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (e) {
      print(e); // Ideally, handle the error more gracefully
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loginWithGoogle() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        // Create a new credential
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        // Once signed in, return the UserCredential
        final UserCredential userCredential = await _auth.signInWithCredential(credential);

        if (userCredential.user != null) {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      }
    } catch (e) {
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
              Image.asset(
                'explorer.png',
                height: 120,
              ),
              const SizedBox(height: 48),
              const Text(
                'Welcome Back! Log In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48),
              _buildTextField(controller: _emailController, hint: 'Enter email...'),
              const SizedBox(height: 16),
              _buildTextField(controller: _passwordController, hint: 'Enter password...', isPassword: true),
              const SizedBox(height: 32),
              _isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          onPressed: _loginWithEmailPassword,
                          child: const Text('LOG IN'),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          onPressed: _loginWithGoogle,
                          child: const Text('Log in with Google'),
                        ),
                      ],
                    ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text(
                  "DON'T HAVE AN ACCOUNT YET?",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String hint, bool isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hint,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: isPassword,
      style: const TextStyle(color: Colors.black87),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loginWithEmailPassword() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (userCredential.user != null) {
        // Navigate to home screen or dashboard
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      print(e); // For debugging
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loginWithGoogle() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        if (userCredential.user != null) {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      print(e); // For debugging
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
              Image.asset(
                'assets/explorer.png', // Make sure to replace this with your asset path
                height: 120,
              ),
              const SizedBox(height: 48),
              const Text(
                'Welcome Back! Log In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48),
              _buildTextField(
                  controller: _emailController,
                  hint: 'Enter email...',
                  icon: Icons.email),
              const SizedBox(height: 16),
              _buildTextField(
                  controller: _passwordController,
                  hint: 'Enter password...',
                  icon: Icons.lock,
                  isPassword: true),
              const SizedBox(height: 32),
              _isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        _loginButton(
                          text: 'LOG IN',
                          onPress: _loginWithEmailPassword,
                          color: Colors.white,
                          textColor: Colors.black87,
                        ),
                        const SizedBox(height: 10),
                        _loginButton(
                          text: 'Log in with Google',
                          onPress: _loginWithGoogle,
                          color: Colors.white,
                          textColor: Colors.black87,
                          icon: FontAwesomeIcons.google,
                        ),
                      ],
                    ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: const Text(
                  "DON'T HAVE AN ACCOUNT YET?",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required String hint,
      IconData? icon,
      bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: hint,
          prefixIcon: Icon(icon, color: Colors.white70),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }

  Widget _loginButton(
      {required String text,
      required VoidCallback onPress,
      required Color color,
      required Color textColor,
      IconData? icon}) {
    return ElevatedButton.icon(
      icon:
          icon != null ? Icon(icon, color: textColor) : const SizedBox.shrink(),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor, backgroundColor: color, // Text color
        minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPress,
    );
  }
}