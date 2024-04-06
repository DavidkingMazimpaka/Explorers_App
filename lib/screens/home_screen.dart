import 'package:flutter/material.dart';
import 'package:helloworld/screens/destination_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Dream Destination Awaits',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  // Placeholder method1()
  bool method1() {
    // Example navigation logic
    // Navigator.pushNamed(context, '/destination');
    return true; // Indicate that method execution was successful
  }

  // Placeholder method2()
  bool method2() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Dream Destination Awaits'),
      ),
      drawer: const NavigationPanel(), // Drawer with navigation options
      body: ListView(
        // Main content of the HomeScreen
        children: const [
          HeaderSection(),
          FeaturedDestinationsSection(),
          AllDestinationsSection(),
        ],
      ),
    );
  }
}

// class NavigationPanel extends StatelessWidget {
//   const NavigationPanel({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         width: 200,
//         color: const Color(0xFF3B4948),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                 top: 20.0,
//                 bottom: 30.0,
//               ),
//               child: Image.asset(
//                 'assets/explorer.png',
//                 width: 100,
//                 height: 100,
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.place, color: Colors.white),
//               title: const Text('Destinations',
//                   style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 // Navigate to the Destinations screen
//                 Navigator.pop(context); // First, close the drawer
//                 Navigator.pushNamed(context, '/home'); // Then navigate
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.settings, color: Colors.white),
//               title:
//                   const Text('Settings', style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 // Navigate to the Settings screen
//                 Navigator.pop(context); // Close the drawer
//                 Navigator.pushNamed(context,
//                     '/profile'); // Replace '/settings' with actual route
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.exit_to_app, color: Colors.white),
//               title:
//                   const Text('Log Out', style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 // Handle logout logic here
//                 Navigator.pop(context); // Close the drawer
//                 // Navigate to the login screen or perform logout operation
//                 Navigator.pushNamed(context, '/logout');
//               },
//             ),
//             const Spacer(),
//             const Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   Icon(Icons.account_circle, color: Colors.white, size: 24.0),
//                   SizedBox(width: 8.0),
//                   Text('User username', style: TextStyle(color: Colors.white)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class NavigationPanel extends StatelessWidget {
  const NavigationPanel({super.key});

  Future<String> _getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    // This will return 'Guest' if no username has been saved
    return prefs.getString('username') ?? 'Guest';
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 200,
        color: const Color(0xFF3B4948),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 30.0,
              ),
              child: Image.asset(
                'assets/explorer.png',
                width: 100,
                height: 100,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.place, color: Colors.white),
              title: const Text('Destinations',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title:
                  const Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.white),
              title:
                  const Text('Log Out', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/logout');
              },
            ),
            const Spacer(),
            FutureBuilder<String>(
              future: _getUsername(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Icon(Icons.account_circle,
                            color: Colors.white, size: 24.0),
                        const SizedBox(width: 8.0),
                        // Display the fetched username
                        Text(snapshot.data!,
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  );
                } else {
                  // Show loading or default text while waiting
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AboveSection extends StatelessWidget {
  const AboveSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Dream Destination Awaits',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DestinationPage(),
    );
  }
}

class DestinationPage extends StatelessWidget {
  const DestinationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Dream Destination Awaits',
          textAlign: TextAlign.left, // Align the text in the center
          style: TextStyle(
            fontWeight: FontWeight.bold, // Custom font weight
            fontSize: 24, // Custom font size
          ),
        ),
        centerTitle: true,
      ),
      drawer: const Drawer(
        child: NavigationPanel(),
      ),
      body: ListView(
        children: const [
          HeaderSection(),
          FeaturedDestinationsSection(),
          AllDestinationsSection(),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Are you ready for your next adventure?',
            textAlign: TextAlign.center, // Align the text in the center
            style: TextStyle(
              fontSize: 16.0, // Set the font size
              fontStyle: FontStyle.italic, // Set the font style to italic
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturedDestinationsSection extends StatelessWidget {
  const FeaturedDestinationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          3,
          (index) => DestinationCard(
                isFeatured: true,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DestinationDetailsScreen(),
                    )),
              )),
    );
  }
}

class AllDestinationsSection extends StatelessWidget {
  const AllDestinationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment
          .center, // Align children in the center horizontally
      children: [
        const Padding(
          padding: EdgeInsets.all(40.0),
          child: Text(
            'All Destinations',
            textAlign:
                TextAlign.center, // Align the text in the center horizontally
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: List.generate(
            4,
            (index) => DestinationCard(
              isFeatured: false,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DestinationDetailsScreen(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DestinationCard extends StatelessWidget {
  final bool isFeatured;
  final VoidCallback onTap; // Add this line

  const DestinationCard(
      {super.key, required this.isFeatured, required this.onTap});

  @override
  Widget build(BuildContext context) {
    IconData iconData = isFeatured ? Icons.star : Icons.place;
    Color iconColor = isFeatured ? Colors.grey : Colors.grey;

    return Card(
      elevation: 4.0,
      color: const Color(0xFF3B4948),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage:
              AssetImage('welcome.jpg'), // Replace with your image path
          radius: 26, // Adjust size as needed
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(iconData, color: iconColor),
            const SizedBox(height: 4.0),
            const Text('Name'),
            const Text('Description'),
          ],
        ),
        trailing: const Icon(Icons.more_vert),
        onTap: onTap, // Use the callback function here
      ),
    );
  }
}
