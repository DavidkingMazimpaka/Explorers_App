// class Destination {
//   String id;
//   String name;
//   String description;
//   String imageUrl;
//   double rating;

//   Destination({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.imageUrl,
//     required this.rating,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'description': description,
//       'imageUrl': imageUrl,
//       'rating': rating,
//     };
//   }

//   factory Destination.fromMap(Map<String, dynamic> map, String documentId) {
//     return Destination(
//       id: documentId,
//       name: map['name'],
//       description: map['description'],
//       imageUrl: map['imageUrl'],
//       rating: map['rating'],
//     );
//   }

//   static fromApiJson(json) {}
// }

// class Destination {
//   String id;
//   String name;
//   String description;
//   String imageUrl;
//   double rating;

//   Destination({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.imageUrl,
//     required this.rating,
//   });

// //   factory Destination.fromApiJson(Map<String, dynamic> json) {
// //     // Extract the nested properties from the JSON response
// //     var properties = json['properties'];
// //     var preview = properties['preview'] ?? {};
// //     var wikipediaExtracts = properties['wikipedia_extracts'] ?? {};

// //     return Destination(
// //       id: json['xid'],
// //       name: properties['name'],
// //       description: wikipediaExtracts['text'] ?? 'No description available.',
// //       imageUrl: preview['source'] ?? 'default_image_placeholder.png', // Provide a default placeholder image
// //       rating: double.tryParse(properties['rate']?.toString() ?? '0') ?? 0.0,
// //     );
// //   }
// // }
//   factory Destination.fromApiJson(Map<String, dynamic> json) {
//     // Ensure that each field checks for null before attempting to parse.
//     var properties = json['properties'];
//     var preview = properties['preview'] as Map<String, dynamic>? ?? {};
//     var wikipediaExtracts =
//         properties['wikipedia_extracts'] as Map<String, dynamic>? ?? {};

//     // When extracting strings, use null-aware operators to provide a default value if null is encountered.
//     String id = json['xid'] as String? ?? 'unknown';
//     String name = properties['name'] as String? ?? 'Unnamed';
//     String description =
//         wikipediaExtracts['text'] as String? ?? 'No description available.';
//     String imageUrl =
//         preview['source'] as String? ?? 'default_image_placeholder.png';
//     double rating =
//         double.tryParse(properties['rate']?.toString() ?? '0') ?? 0.0;

//     return Destination(
//       id: id,
//       name: name,
//       description: description,
//       imageUrl: imageUrl,
//       rating: rating,
//     );
//   }
// }

class Destination {
  final String id;
  final String name;
  final double distance;
  final int rate;
  final String osm;
  final String kinds;

  Destination({
    required this.id,
    required this.name,
    required this.distance,
    required this.rate,
    required this.osm,
    required this.kinds,
  });

//   factory Destination.fromApiJson(Map<String, dynamic> json) {
//     final properties = json['properties'];
//     return Destination(
//       id: properties['xid'] as String? ?? '', // Providing default empty string
//       name: properties['name'] as String? ?? 'Name not available',
//       distance: properties['dist'] as double? ??
//           0.0, // Assuming distance can be safely defaulted to 0.0
//       rate: properties['rate'] as int? ??
//           0, // Assuming rate can be safely defaulted to 0
//       osm: properties['osm'] as String? ?? '',
//       kinds: properties['kinds'] as String? ?? '',
//     );
//   }
// }

  factory Destination.fromApiJson(Map<String, dynamic> json) {
    final properties = json['properties'];
    return Destination(
      id: properties['xid'] as String? ?? '', // Providing default empty string
      name: properties['name'] as String? ?? 'Name not available',
      distance: properties['dist'] as double? ??
          0.0, // Assuming distance can be safely defaulted to 0.0
      rate: properties['rate'] as int? ??
          0, // Assuming rate can be safely defaulted to 0
      osm: properties['osm'] as String? ?? '',
      kinds: properties['kinds'] as String? ?? '',
    );
  }
}
