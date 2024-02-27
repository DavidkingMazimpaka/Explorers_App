class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }


  factory User.fromFirestore(Map<String, dynamic> firestore) {
    return User(
      id: firestore['id'] as String,
      name: firestore['name'] as String,
      email: firestore['email'] as String,
    );
  }
}
