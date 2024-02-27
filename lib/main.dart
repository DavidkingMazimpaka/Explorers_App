// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:helloworld/screens/home_screen.dart';
import 'package:helloworld/screens/logout_screen.dart';
import 'package:helloworld/screens/tripdetails.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/destination_details_screen.dart';
import 'screens/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explorers App',
      // Removed the 'home' property.
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        hintColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`.
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      // Define the routes
      initialRoute: '/', // Default is '/' but it's nice to be explicit
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(), // Updated to MainLayout
        '/details': (context) => const DestinationDetailsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/tripdetails': (context) => const TripDetailsScreen(),
        '/logout': (context) => const LogoutScreen(),
        // ... other routes
      },
    );
  }
}
