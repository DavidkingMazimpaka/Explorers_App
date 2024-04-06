import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/destinations.dart'; // 
import 'models/feedback.dart'; // 
import 'models/users.dart'; // 

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Users CRUD Operations
  Future<void> addUser(UserModel user) async {
    await _db.collection('Users').doc(user.id).set(user.toMap());
  }

  Stream<List<UserModel>> getUsers() {
    return _db.collection('Users').snapshots().map((snapshot) => snapshot.docs
        .map((doc) =>
            UserModel.fromMap(doc.data(), doc.id))
        .toList());
  }

  Future<void> updateUser(String userId, Map<String, dynamic> data) async {
    await _db.collection('Users').doc(userId).update(data);
  }

  Future<void> deleteUser(String userId) async {
    await _db.collection('Users').doc(userId).delete();
  }

  // // Destinations CRUD Operations
  // Future<void> addDestination(Destination destination) async {
  //   await _db.collection('Destinations').add(destination.toMap());
  // }

  // Stream<List<Destination>> getDestinations() {
  //   return _db.collection('Destinations').snapshots().map((snapshot) => snapshot
  //       .docs
  //       .map((doc) =>
  //           Destination.fromMap(doc.data(), doc.id))
  //       .toList());
  // }

  // Future<void> updateDestination(
  //     String destinationId, Map<String, dynamic> data) async {
  //   await _db.collection('Destinations').doc(destinationId).update(data);
  // }

  // Future<void> deleteDestination(String destinationId) async {
  //   await _db.collection('Destinations').doc(destinationId).delete();
  // }

  // Feedback CRUD Operations
  Future<void> addFeedbackToFirestore(FeedbackItem feedback) async {
    await _db.collection('Feedback').add(feedback.toMap());
  }
}
