import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helloworld/screens/tripdetails.dart'; // Adjust this path based on your project's structure

void main() {
  testWidgets('TripDetailsScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TripDetailsScreen()));

    // Verify UI elements
    expect(find.text('Trip to End Date'), findsOneWidget); // Assuming a static trip name
    expect(find.text('Trip Image'), findsOneWidget); // Assuming an image placeholder text
    expect(find.text('Name'), findsOneWidget); // Assuming static text for demonstration
    expect(find.text('Short Description'), findsOneWidget); // Placeholder text
    expect(find.byType(CheckboxListTile), findsOneWidget);
  });
}
