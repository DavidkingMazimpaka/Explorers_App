import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:helloworld/firebase_options.dart';
import 'package:helloworld/screens/login_screen.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  });

  testWidgets('LoginScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // Verify UI elements
    expect(find.text('Welcome Back! Log In'), findsOneWidget);
    expect(find.text('Enter email...'), findsOneWidget);
    expect(find.text('Enter password...'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'LOG IN'),
        findsOneWidget); // Modified to precisely find the button with text 'LOG IN'
    expect(find.text("DON'T HAVE AN ACCOUNT YET?"), findsOneWidget);
  });

  testWidgets('LoginScreen Login Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // Enter email and password
    await tester.enterText(
        find.byKey(const Key('email_field')), 'test@example.com');
    await tester.enterText(find.byKey(const Key('password_field')), 'password');

    // Tap on login button
    await tester.tap(find.widgetWithText(ElevatedButton,
        'LOG IN')); // Ensures the tap is on the button with 'LOG IN'
    await tester.pump();

    // Verify that login process starts (loading indicator appears)
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}

