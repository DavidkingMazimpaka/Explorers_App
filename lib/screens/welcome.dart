import 'package:flutter/material.dart'; // Import the material package

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacementNamed(
        context, '/home'); // Make sure 'context' is accessible
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/welcome.png"), // Adjust the image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            "Explorer's Path App",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
