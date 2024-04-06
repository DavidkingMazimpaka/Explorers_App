import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/models/feedback.dart';
import 'package:helloworld/firestore_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Profile'),
      ),
      drawer: const NavigationPanel(), // Drawer for navigation
      body: const MainPanel(), // Your main profile content
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
//                 Navigator.pushNamed(context, '/login');
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

class MainPanel extends StatelessWidget {
  const MainPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      color: Colors.white,
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileSection(),
            SizedBox(height: 35),
            FavoriteDestinations(),
            SizedBox(height: 60),
            TripsSection(),
            SizedBox(height: 80),
            FeedbackForm(),
          ],
        ),
      ),
    );
  }
}

// class ProfileSection extends StatelessWidget {
//   const ProfileSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Padding(
//         padding: EdgeInsets.all(30.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               backgroundColor: Colors.grey,
//               radius: 40,
//             ),
//             SizedBox(height: 10),
//             Text(
//               '@Username',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  String _username = 'Guest';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? 'Guest';
    });
  }

  // Generates a unique color based on the username.
  Color _avatarColor(String username) {
    final int hash =
        username.hashCode; // Uses hash code of username to generate a color.
    final double hue = (hash % 360).toDouble(); // Converts hash to a hue value.
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90)
        .toColor(); // Generates a saturated and bright color.
  }

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Padding(
    //     padding: const EdgeInsets.all(30.0),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const CircleAvatar(
    //           backgroundColor: Colors.grey,
    //           radius: 40,
    //         ),
    // Displays a CircleAvatar with a background color unique to the username.
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: _avatarColor(
                  _username), // Avatar color is determined by the username.
              radius: 40,
              child: Text(
                _username.isNotEmpty
                    ? _username[0].toUpperCase()
                    : '?', // Displays the first letter of the username.
                style: const TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '@$_username',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteDestinations extends StatelessWidget {
  const FavoriteDestinations({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.grey,
      child: Container(
        padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(7.0),
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
                backgroundImage: AssetImage('path/to/your/image.png'),
                radius: 30,
              ),
              title: Text('Destination name'),
              subtitle: Text('Destination description'),
            ),
          ],
        ),
      ),
    );
  }
}

class TripsSection extends StatelessWidget {
  const TripsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'My Trips',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Icon(
                  Icons.card_travel,
                  size: 48,
                  color: Colors.grey,
                ),
                Text('No Trips Yet'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController _feedbackController = TextEditingController();

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Feedback',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            controller: _feedbackController,
            decoration: const InputDecoration(
              hintText: 'Enter your feedback...',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          // The CheckboxListTile and other components remain unchanged
          ElevatedButton(
            onPressed: () {
              if (_feedbackController.text.isNotEmpty) {
                // Instantiate FirestoreService
                FirestoreService firestoreService = FirestoreService();
                // Use the instance to call addFeedbackToFirestore
                firestoreService
                    .addFeedbackToFirestore(FeedbackItem(
                  userId:
                      "YourUserIdHere", // Adjust according to your user management logic
                  content: _feedbackController.text,
                  createDate: DateTime.now(), id: '',
                ))
                    .then((_) {
                  _feedbackController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Feedback submitted successfully!')),
                  );
                }).catchError((error) {
                  if (kDebugMode) {
                    print("Error submitting feedback: $error");
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Failed to submit feedback. Please try again.')),
                  );
                });
              }
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
            ),
            child: const Text('CREATE FEEDBACK'),
          ),
        ],
      ),
    );
  }
}
