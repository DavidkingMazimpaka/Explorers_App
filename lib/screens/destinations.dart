import 'package:flutter/material.dart';

void main() {
  runApp(AboveSection());
}

class NavigationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Color(0xFF3B4948),
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
          ListTile(
            leading: Icon(Icons.place, color: Colors.white),
            title: Text('Destinations', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text('Settings', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.white),
            title: Text('Log Out', style: TextStyle(color: Colors.white)),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Dream Destination Awaits',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DestinationPage(),
    );
  }
}



class DestinationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Dream Destination Awaits',
          textAlign: TextAlign.left, // Align the text in the center
          style: TextStyle(
            fontWeight: FontWeight.bold, // Custom font weight
            fontSize: 24, // Custom font size
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: NavigationPanel(),
      ),
      body: ListView(
        children: [
          HeaderSection(),
          FeaturedDestinationsSection(),
          AllDestinationsSection(),
        ],
      ),
    );
  }
}




class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) => DestinationCard(isFeatured: true)),
    );
  }
}



class AllDestinationsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Align children in the center horizontally
      children: [
        Padding(
          padding: EdgeInsets.all(40.0),
          child: Text(
            'All Destinations',
            textAlign: TextAlign.center, // Align the text in the center horizontally
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: List.generate(4, (index) => DestinationCard(isFeatured: false)),
        ),
      ],
    );
  }
}




class DestinationCard extends StatelessWidget {
  final bool isFeatured;

  DestinationCard({required this.isFeatured});

  @override
  Widget build(BuildContext context) {
    IconData iconData = isFeatured ? Icons.star : Icons.place;
    Color iconColor = isFeatured ? Colors.grey : Colors.grey;

    return Card(
      elevation: 4.0,
      color: Color(0xFF3B4948),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/destination_image.jpg'), // Replace with your image path
          radius: 26, // Adjust size as needed
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(iconData, color: iconColor),
            SizedBox(height: 4.0),
            Text('Name'),
            Text('Description'),
          ],
        ),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
