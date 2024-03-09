// ignore: avoid_web_libraries_in_flutter

class UserModel {
  String id;
  String email;
  String? fullName;
  String username;
  String? location;

  UserModel({
    required this.id,
    required this.email,
    this.fullName,
    required this.username,
    this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fullName': fullName,
      'username': username,
      'location': location,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      id: documentId,
      email: map['email'] ?? '', // Corrected access
      fullName: map['fullName'], // Corrected access
      username: map['username'] ?? '', // Corrected access
      location: map['location'], // Corrected access
    );
  }
}
