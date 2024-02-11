import 'package:flutter/material.dart';

void main() {
  runApp(const AboveSection());
}

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: const Color(0xFF3B4948),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, bottom: 30.0, right: 90.0),
            child: Image.asset(
              'images/explorer.png',
              width: 100,
              height: 100,
            ),
          ),
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
      children: List.generate(3, (index) => const DestinationCard(isFeatured: true)),
    );
  }
}



class AllDestinationsSection extends StatelessWidget {
  const AllDestinationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Align children in the center horizontally
      children: [
        const Padding(
          padding: EdgeInsets.all(40.0),
          child: Text(
            'All Destinations',
            textAlign: TextAlign.center, // Align the text in the center horizontally
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: List.generate(4, (index) => const DestinationCard(isFeatured: false)),
        ),
      ],
    );
  }
}




class DestinationCard extends StatelessWidget {
  final bool isFeatured;

  const DestinationCard({super.key, required this.isFeatured});

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
          backgroundImage: AssetImage('images/destination_image.jpg'), // Replace with your image path
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
      ),
    );
  }
}
