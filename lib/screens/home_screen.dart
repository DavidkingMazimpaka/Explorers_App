import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helloworld/models/destinations.dart';
import 'package:helloworld/screens/destination_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Dream Destination Awaits',
      theme: ThemeData(
        primaryColor: const Color(0xFF3B4948), // Change primary color
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({Key? key});

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

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({Key? key});

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
  const AboveSection({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Dream Destination Awaits',
      theme: ThemeData(
        primaryColor: const Color(0xFF3B4948), // Change primary color
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DestinationPage(),
    );
  }
}

class DestinationPage extends StatelessWidget {
  const DestinationPage({Key? key});

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
  const HeaderSection({Key? key});

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
  const FeaturedDestinationsSection({Key? key});

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

class AllDestinationsSection extends StatefulWidget {
  const AllDestinationsSection({Key? key});

  @override
  State<AllDestinationsSection> createState() => _AllDestinationsSectionState();
}

class _AllDestinationsSectionState extends State<AllDestinationsSection> {
  late Future<List<Destination>> _destinations;

  @override
  void initState() {
    super.initState();
    _destinations = fetchDestinations();
  }

  Future<List<Destination>> fetchDestinations() async {
    final uri = Uri.parse('https://api.opentripmap.com/0.1/en/places/radius')
        .replace(queryParameters: {
      'radius': '10000', // adjust as needed
      'lon': '30.1157596', // adjust as needed
      'lat': '-1.9626447', // adjust as needed
      'apikey':
          '5ae2e3f221c38a28845f05b6b36b94feeea7a570f166f48d2526c157', // replace with your actual API key
    });

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['features'];
      return data.map((json) => Destination.fromApiJson(json)).toList();
    } else {
      throw Exception('Failed to load destinations');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Destination>>(
      future: _destinations,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final destination = snapshot.data![index];
              return Card(
                color: const Color(0xFF3B4948), // Background color
                elevation: 4.0,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListTile(
                  title: Text(
                    destination.name,
                    style: TextStyle(color: Colors.black), // Text color
                  ),
                  subtitle: Text(
                    'Distance: ${destination.distance.toStringAsFixed(2)} meters\nRate: ${destination.rate}\nKinds: ${destination.kinds}',
                    style: TextStyle(color: Colors.black), // Text color
                  ),
                  leading: const Icon(Icons.place), // Placeholder icon
                ),
              );
            },
          );
        } else {
          return const Text('No destinations found.');
        }
      },
    );
  }
}

class DestinationCard extends StatelessWidget {
  final bool isFeatured;
  final VoidCallback onTap; // Add this line

  const DestinationCard(
      {Key? key, required this.isFeatured, required this.onTap});

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

void main() {
  runApp(const MyApp());
}
