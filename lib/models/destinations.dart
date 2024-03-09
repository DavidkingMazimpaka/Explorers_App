
class Destination {
  String id;
  String name;
  String description;
  String imageUrl;
  double rating;

  Destination({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'rating': rating,
    };
  }

  factory Destination.fromMap(Map<String, dynamic> map, String documentId) {
    return Destination(
      id: documentId,
      name: map['name'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      rating: map['rating'],
    );
  }
}
