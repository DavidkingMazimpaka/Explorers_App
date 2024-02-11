import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Travel Profile',
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
  const NavigationPanel({Key? key}) : super(key: key);

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
            ), // Adjust the padding as needed
            child: Image.asset(
              'images/explorer.png', // Replace with your actual image path
              width: 100, // Set the width as needed
              height: 100, // Set the height as needed
            ),
          ),
          // Middle section with menu items, no padding needed between items
          ListTile(
            leading: const Icon(Icons.place, color: Colors.white),
            title: const Text('Destinations', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: const Text('Settings', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.white),
            title: const Text('Log Out', style: TextStyle(color: Colors.white)),
          ),
          // Spacer to push the bottom content to the end
          const Spacer(),
          // Bottom section with the user's username
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(Icons.account_circle, color: Colors.white, size: 24.0),
                const SizedBox(width: 8.0),
                const Text('User username', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class MainPanel extends StatelessWidget {
  const MainPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(30.0), // Adjust padding as needed
        color: Colors.white, // Set the background color to white
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileSection(),
              SizedBox(height: 35), // Space between sections
              FavoriteDestinations(),
              SizedBox(height: 60), // Space between sections
              TripsSection(),
              SizedBox(height: 80), // Space between sections
              FeedbackForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center( // Center the ProfileSection vertically
      child: Padding(
        padding: const EdgeInsets.all(30.0), // Padding inside the section
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align content vertically
          children: [
            CircleAvatar(
              // Replace with your user's avatar image
              backgroundColor: Colors.grey,
              radius: 40, // Adjust the size as needed
            ),
            const SizedBox(height: 10), // Add space between the avatar and the username
            Text(
              '@Username', // Display the username
              style: TextStyle(
                fontSize: 24, // Adjust the font size as needed
                fontWeight: FontWeight.bold, // Make the username bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class FavoriteDestinations extends StatelessWidget {
  const FavoriteDestinations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), //border radius
      ),
      color: Colors.grey, //background color
      child: Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 20.0), // Add bottom padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),  //padding inside
              child: Text(
                'Favorite Destinations',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            ListTile(
              leading: CircleAvatar(
                //picture
                backgroundImage: AssetImage('path/to/your/image.png'),
                radius: 30,
              ),
              title: Text('Destination name'),
              subtitle: Text('Destination description'),
            ),
            // Repeat ListTiles for each destination
          ],
        ),
      ),
    );
  }
}





class TripsSection extends StatelessWidget {
  const TripsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
        children: [
          Text(
            'My Trips',
            style: TextStyle(
              fontSize: 20, // Adjust the font size as needed
              fontWeight: FontWeight.bold, // Make the title bold
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0), // Add padding inside the section
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
        ],
      ),
    );
  }
}

class FeedbackForm extends StatelessWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0), // Add vertical padding
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
