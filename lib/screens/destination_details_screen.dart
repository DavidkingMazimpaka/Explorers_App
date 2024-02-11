import 'package:flutter/material.dart';
import 'package:test1/screens/tripdetails.dart';

class DestinationDetailsScreen extends StatelessWidget {
  const DestinationDetailsScreen({Key? key}) : super(key: key);

  void navigateToTripDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TripDetailsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destination Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Handle favorite action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[300], // Placeholder for an image
              height: 200,
              child: const Center(
                child:
                    Text('Image Placeholder'), // Replace with your Image widget
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Name', // Replace with the actual destination name
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Description', // Replace with the actual destination description
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Upcoming Trips',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // List of Upcoming Trips
            ...List.generate(
              3,
              (index) => ListTile(
                title: const Text('Trip name'), // Replace with actual trip name
                subtitle: const Text(
                    'Trip short description'), // Replace with actual trip description
                trailing: const Icon(Icons.arrow_forward),
                leading: Radio(
                  value: false,
                  groupValue: true,
                  onChanged: (bool? value) {
                    // Handle trip selection
                  },
                ),
                onTap: () {
                  // Navigate to trip details
                  navigateToTripDetails(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}