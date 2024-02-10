import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Travel Profile',
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          NavigationPanel(),
          Expanded(
            child: MainPanel(),
          ),
        ],
      ),
    );
  }
}

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Set the width of the navigation bar
      color: const Color(0xFF3B4948), // The color you provided earlier
      child: Column(
        children: [
          // Top section with the image
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 30.0,
                right: 90.0), // Adjust the padding as needed
            child: Image.asset(
              'welcome.png', // Replace with your actual image path
              width: 100, // Set the width as needed
              height: 100, // Set the height as needed
            ),
          ),
          // Middle section with menu items, no padding needed between items
          const ListTile(
            leading: Icon(Icons.place, color: Colors.white),
            title: Text('Destinations', style: TextStyle(color: Colors.white)),
          ),
          const ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text('Settings', style: TextStyle(color: Colors.white)),
          ),
          const ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.white),
            title: Text('Log Out', style: TextStyle(color: Colors.white)),
          ),
          // Spacer to push the bottom content to the end
          const Spacer(),
          // Bottom section with the user's username
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

class MainPanel extends StatelessWidget {
  const MainPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0), // Adjust padding as needed
        color: Colors.white, // Set the background color to white
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4.0,
                child: ProfileSection(),
              ),
              SizedBox(height: 16), // Space between cards
              Card(
                elevation: 4.0,
                child: FavoriteDestinations(),
              ),
              SizedBox(height: 16), // Space between cards
              Card(
                elevation: 4.0,
                child: TripsSection(),
              ),
              SizedBox(height: 16), // Space between cards
              Card(
                elevation: 4.0,
                child: FeedbackForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// This widget is responsible for displaying the user's profile information.

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0), // Padding inside the card
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            // Replace with your user's avatar image
            backgroundColor: Colors.grey,
            radius: 40, // Adjust the size as needed
          ),
          SizedBox(width: 10), // Add space between the avatar and the username
          Text(
            '@Username',
            style: TextStyle(
              fontSize: 24, // Adjust the font size as needed
              fontWeight: FontWeight.bold, // Make the username bold
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteDestinations extends StatelessWidget {
  const FavoriteDestinations({super.key});

  @override
  Widget build(BuildContext context) {
    // This list can be dynamic based on user's favorite destinations
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0), // Add vertical padding
          child: Text(
            'Favorite Destinations',
            style: TextStyle(
              fontSize: 20, // Adjust the font size as needed
              fontWeight: FontWeight.bold, // Make the title bold
            ),
          ),
        ),
        // You can generate these ListTiles with a ListView.builder in a real app
        ListTile(
          leading: Icon(Icons.favorite, color: Colors.red),
          title: Text('Destination name'),
          subtitle: Text('Destination description'),
        ),
        // Repeat ListTiles for each destination
      ],
    );
  }
}

class TripsSection extends StatelessWidget {
  const TripsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: 20.0), // Add vertical padding
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Trips',
            style: TextStyle(
              fontSize: 20, // Adjust the font size as needed
              fontWeight: FontWeight.bold, // Make the title bold
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0), // Add padding inside the card
              child: Column(
                children: [
                  Icon(
                    Icons.card_travel,
                    size: 48, // Adjust the icon size as needed
                    color: Colors.grey, // Set the icon color
                  ),
                  Text('No Trips Yet'),
                  // More content can be added here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeedbackForm extends StatelessWidget {
  const FeedbackForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: 20.0), // Add vertical padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Feedback',
            style: TextStyle(
              fontSize: 20, // Adjust the font size as needed
              fontWeight: FontWeight.bold, // Make the title bold
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Enter your feedback...',
              border: OutlineInputBorder(), // Add a border to the TextField
            ),
          ),
          const SizedBox(
              height: 10), // Add space between the TextField and the Checkbox
          CheckboxListTile(
            value: false,
            onChanged: (bool? newValue) {
              // Handle the checkbox state change
            },
            title: const Text('Enjoyable'), // Add text next to the checkbox
          ),
          ElevatedButton(
            onPressed: () {
              // Handle feedback submission
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black, // Set the text color
            ),
            child: const Text('CREATE FEEDBACK'),
          ),
        ],
      ),
    );
  }
}
