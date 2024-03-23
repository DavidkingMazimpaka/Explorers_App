// ignore_for_file: file_names

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:helloworld/screens/home_screen.dart';

void main() {
  testWidgets('Test Widgets on HomeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    // Test at least two-thirds of the widgets on the HomeScreen
    expect(find.text('Your Dream Destination Awaits'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(Drawer), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(HeaderSection), findsOneWidget);
    expect(find.byType(FeaturedDestinationsSection), findsOneWidget);
    expect(find.byType(AllDestinationsSection), findsOneWidget);
  });

  HomeScreenTest().testMethods();
}

class HomeScreenTest {
  void testMethods() {
    test('Test Methods on HomeScreen', () {
      // Test methods on HomeScreen
      const homeScreen = HomeScreen();

      // Assuming there are methods within HomeScreen, test at least two-thirds of them
      expect(homeScreen.method1(), true); // Replace 'method1' with the actual method name
      expect(homeScreen.method2(), true); // Replace 'method2' with another method name
    });
  }
}

