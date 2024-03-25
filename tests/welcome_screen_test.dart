import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/screens/login_screen.dart'; // Assuming your actual LoginScreen
import 'package:helloworld/screens/signup_screen.dart';
import 'package:helloworld/screens/welcome_screen.dart'; 
import 'package:firebase_core/firebase_core.dart'; // For Firebase initialization

void main() async {
  await Firebase.initializeApp();
// This is the setup for the tests.
  group('WelcomeScreen Tests', () {
    // Test to ensure the UI elements are present on the screen.
    testWidgets('WelcomeScreen UI Test', (WidgetTester tester) async {
      // Rendering the WelcomeScreen widget.
      await tester.pumpWidget(const MaterialApp(home: WelcomeScreen()));
      await tester.pumpAndSettle(); // Wait for animations and async logic if any.

      // Checking if the Image is displayed.
      expect(find.byType(Image), findsOneWidget);

      // Checking for the presence of 'SIGN UP' button.
      expect(find.widgetWithText(ElevatedButton, 'SIGN UP'), findsOneWidget);

      // Checking for the presence of 'LOG IN' button.
      expect(find.widgetWithText(OutlinedButton, 'LOG IN'), findsOneWidget);
    });

    // Test to check navigation to the SignUp screen when the 'SIGN UP' button is tapped.
    testWidgets('WelcomeScreen navigates to SignUpScreen on SIGN UP button tap', (WidgetTester tester) async {
      // Rendering the WelcomeScreen widget inside MaterialApp to provide a navigation context.
      await tester.pumpWidget(MaterialApp(
        home: const WelcomeScreen(),
        routes: {
          '/signup': (context) => const SignUpScreen(), // Dummy SignUpScreen for testing purposes.
          '/login': (context) => const LoginScreen(), // Replace with your actual LoginScreen
        },
      ));
      await tester.pumpAndSettle(); // Wait for animations and async logic.

      // Tapping the 'SIGN UP' button.
      await tester.tap(find.widgetWithText(ElevatedButton, 'SIGN UP'));
      await tester.pumpAndSettle(); // Wait for potential navigation animations to complete.

      // Verifying that tapping 'SIGN UP' initiates navigation to SignUpScreen.
      expect(find.byType(SignUpScreen), findsOneWidget);
    });

    // Test to check navigation to the Login screen when the 'LOG IN' button is tapped.
    testWidgets('WelcomeScreen navigates to LoginScreen on LOG IN button tap', (WidgetTester tester) async {
      // Option 2 (repeated for clarity): Initialize Firebase (if needed)
      // Uncomment the following line if your tests use Firebase functionalities
      // await Firebase.initializeApp();

      // Rendering the WelcomeScreen widget inside MaterialApp to provide a navigation context.
      await tester.pumpWidget(MaterialApp(
        home: const WelcomeScreen(),
        routes: {
          '/signup': (context) => const SignUpScreen(), // Dummy SignUpScreen for testing purposes.
          '/login': (context) => const LoginScreen(), // Replace with your actual LoginScreen
        },
      ));
      await tester.pumpAndSettle(); // Wait for animations and async logic.

      // Tapping the 'LOG IN' button.
      await tester.tap(find.widgetWithText(OutlinedButton, 'LOG IN'));
      await tester.pumpAndSettle(); // Wait for potential navigation animations to complete.

      // Verifying that tapping 'LOG IN' initiates navigation to LoginScreen.
      expect(find.byType(LoginScreen), findsOneWidget); // Replace with the actual LoginScreen widget type
    });
  });
}
