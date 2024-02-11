import 'package:flutter/material.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Close button and Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context); // Close the screen
                  },
                ),
                const Expanded(
                  child: Text(
                    'Trip to End Date',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.transparent),
                  onPressed: () {},
                ),
              ],
            ),
            const Divider(),
            // Trip image
            Container(
              height: 200,
              color: Colors.grey[300], // Replace with actual image
              child: const Center(
                child: Text('Trip Image'),
              ),
            ),
            const SizedBox(height: 16),
            // Trip Details
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Short Description',
                style: TextStyle(fontSize: 16),
              ),
            ),
            // RSVP Checkbox
            CheckboxListTile(
              title: const Text("RSVP I'll Be There!"),
              value: false,
              onChanged: (newValue) {
                // Handle change
              },
              controlAffinity: ListTileControlAffinity
                  .leading, // Position the checkbox at the start of the ListTile
            ),
          ],
        ),
      ),
    );
  }
}
