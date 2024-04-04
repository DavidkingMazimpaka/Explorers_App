// ignore_for_file: unused_import

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/screens/login_screen.dart'; // Assuming your actual LoginScreen
import 'package:helloworld/screens/signup_screen.dart';
import 'package:helloworld/screens/welcome_screen.dart'; 
import 'package:firebase_core/firebase_core.dart'; // For Firebase initialization

void main() {
  testWidgets('WelcomeScreen UI Tests', (WidgetTester tester) async {
    // Pump the WelcomeScreen widget
    await tester.pumpWidget(const MaterialApp(home: WelcomeScreen()));

    // Verify main widgets are present
    expect(find.byType(Image), findsOneWidget); // Check for an Image widget
    expect(find.text('SIGN UP'), findsOneWidget); // Check for SIGN UP button
    expect(find.text('LOG IN'), findsOneWidget); // Check for LOG IN button

    // Test interactions
  });
}