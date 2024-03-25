// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helloworld/screens/login_screen.dart';
import 'package:helloworld/screens/logout_screen.dart';

void main() {
  testWidgets('LogoutScreen UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: LogoutScreen(),
    ));

    // Verify UI elements
    expect(find.text('Confirm Logout'), findsOneWidget);
    expect(find.text('Are you sure you want to logout?'), findsOneWidget);
    expect(find.text('Logout'), findsNothing); // Logout button should not be visible initially
  });

  testWidgets('LogoutScreen Dialog Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: LogoutScreen(),
    ));

    // Tap on confirm logout button
    await tester.tap(find.text('Confirm Logout'));
    await tester.pump();

    // Verify that logout confirmation dialog appears
    expect(find.text('Confirm Logout'), findsNothing); // Confirm Logout button should disappear
    expect(find.text('Confirm Logout'), findsNothing); // Confirm Logout text should disappear
    expect(find.text('Cancel'), findsOneWidget); // Cancel button should appear
    expect(find.text('Logout'), findsOneWidget); // Logout button should appear
  });

  testWidgets('LogoutScreen Logout Functionality Test',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: MyApp(),
      routes: {
        '/login': (context) => const LoginScreen(), // Provide a mock LoginScreen
      },
    ));

    // Tap on confirm logout button
    await tester.tap(find.text('Confirm Logout'));
    await tester.pump();

    // Tap on logout button in the dialog
    await tester.tap(find.text('Logout'));
    await tester.pumpAndSettle();

    // Verify that the route changes to '/login' after logout
    expect(find.byType(LogoutScreen), findsNothing); // LogoutScreen should disappear
    expect(find.byType(LoginScreen), findsOneWidget); // LoginScreen should appear
  });
}
