class UserModel {
  String id;
  String email;
  String? fullName;
  String username;
  String? location;

  UserModel({required this.id, required this.email, this.fullName, required this.username, this.location});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fullName': fullName,
      'username': username,
      'location': location,
    };
  }

  // Added factory constructor to create a UserModel from a map
  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      id: documentId,
      email: map['email'],
      fullName: map['fullName'],
      username: map['username'],
      location: map['location'],
    );
  }
}
