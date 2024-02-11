import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Map<String, WidgetBuilder> _routes = {
    '/logout': (context) => const LogoutScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logout Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LogoutScreen(),
      routes: _routes,
    );
  }
}

class LogoutScreen extends StatelessWidget {
  static const String routeName = '/logout';

  const LogoutScreen({Key? key}) : super(key: key);

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Dismiss dialog
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss dialog
                Navigator.pushReplacementNamed(
                    context, '/login'); // Navigate to login
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Are you sure you want to logout?',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showLogoutConfirmationDialog(context),
              child: const Text('Confirm Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
