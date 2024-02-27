import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/destinations.dart'; // Ensure this path matches your project structure
import 'models/feedback.dart'; // Ensure this path matches your project structure
import 'models/users.dart'; // Ensure this path matches your project structure

class FirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

// Adding a destination
  Future<void> addDestination(Destination destination) async {
    await _firebaseFirestore
        .collection('Destinations')
        .add(destination.toMap());
  }

  // Fetching all destinations
  Stream<List<Destination>> getDestinations() {
    return _firebaseFirestore
        .collection('Destinations')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Destination.fromFirestore(
              doc.data() as DocumentSnapshot<Object?>))
          .toList();
    });
  }

  // Updating a destination
  Future<void> updateDestination(
      String destinationId, Map<String, dynamic> data) async {
    await _firebaseFirestore
        .collection('Destinations')
        .doc(destinationId)
        .update(data);
  }

  // Deleting a destination
  Future<void> deleteDestination(String destinationId) async {
    await _firebaseFirestore
        .collection('Destinations')
        .doc(destinationId)
        .delete();
  }

  // Method for adding feedback
  Future<void> addFeedbackToFirestore(FeedbackItem feedback) async {
    await _firebaseFirestore.collection('Feedback').add(feedback.toMap());
  }

  // You can add more methods here for other Firestore interactions
}

Future<void> addUser(User user) async {
  await FirebaseFirestore.instance
      .collection('Users')
      .doc(user.id)
      .set(user.toMap());
}

Future<List<User>> getUsers() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Users').get();

  return querySnapshot.docs.map((doc) {
    return User.fromFirestore(doc.data() as Map<String, dynamic>);
  }).toList();
}

Future<void> updateUser(User user) async {
  await FirebaseFirestore.instance
      .collection('Users')
      .doc(user.id)
      .update(user.toMap());
}

Future<void> deleteUser(String userId) async {
  await FirebaseFirestore.instance.collection('Users').doc(userId).delete();
}
