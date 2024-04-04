// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helloworld/screens/profile_screen.dart'; // Adjust this path based on your project's structure

void main() {
  testWidgets('ProfileScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

    // Verify UI elements
    expect(find.text('Travel Profile'), findsOneWidget); // App bar title
    expect(find.byType(CircleAvatar), findsWidgets); // User avatar
    expect(find.byType(FavoriteDestinations), findsOneWidget); // Custom widget for favorites
    expect(find.byType(TripsSection), findsOneWidget); // Trips section
    expect(find.byType(FeedbackForm), findsOneWidget); // Feedback form
  });
}
