class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  // Convert a User into a Map. The keys must correspond to the names of the 
  // fields in the Firestore document.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  // A method to create a User from a document snapshot
  factory User.fromFirestore(Map<String, dynamic> firestore) {
    return User(
      id: firestore['id'] as String,
      name: firestore['name'] as String,
      email: firestore['email'] as String,
    );
  }
}
