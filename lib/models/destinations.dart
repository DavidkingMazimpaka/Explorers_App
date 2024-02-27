import 'package:cloud_firestore/cloud_firestore.dart';

class Destination {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double rating;
  final bool featured;
  final DateTime created;
  final DateTime updated;

  Destination({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.featured,
    required this.created,
    required this.updated,
  });

  factory Destination.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Destination(
      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      rating: (data['rating'] ?? 0).toDouble(),
      featured: data['featured'] ?? false,
      created: (data['created'] as Timestamp).toDate(),
      updated: (data['updated'] as Timestamp).toDate(),
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'description': description,
  //     'imageUrl': imageUrl,
  //     'rating': rating,
  //     'featured': featured,
  //     'created': Timestamp.fromDate(created),
  //     'updated': Timestamp.fromDate(updated),
  //   };
  // }
}
