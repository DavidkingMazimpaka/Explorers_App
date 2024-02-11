import 'package:flutter/material.dart';

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF3B4948),
            ),
            child: Image.asset('assets/explorer.png'),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: const Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, '/home'); // Assuming '/home' is a named route
            },
          ),
          ListTile(
            leading: const Icon(Icons.place, color: Colors.white),
            title: const Text('Destinations',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushReplacementNamed(context,
                  '/destinations'); // Assuming '/destinations' is a named route
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title:
                const Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushReplacementNamed(context,
                  '/settings'); // Assuming '/settings' is a named route
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.white),
            title: const Text('Log Out', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Log out logic and navigate to login screen
              // Example: Navigator.pushReplacementNamed(context, '/login');
            },
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.account_circle, color: Colors.white, size: 24.0),
                SizedBox(width: 8.0),
                Text('User username', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
