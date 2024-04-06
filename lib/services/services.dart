import 'package:http/http.dart' as http;
import 'dart:convert';

class OpenTripMapService {
  static Future<List<Map<String, String>>> fetchTouristAttractions() async {
  const apiKey = '5ae2e3f221c38a28845f05b6b4561abe224d8e3ca1c96bb0cdbf91f7'; // Replace with your actual API key

    final response = await http.get(
      Uri.parse('https://api.opentripmap.com/0.1/en/places/radius?radius=1000&lon=YOUR_LONGITUDE&lat=YOUR_LATITUDE&kinds=tourist_attraction&limit=10&apikey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .where((place) =>
              place.containsKey('name') &&
              place.containsKey('description') &&
              place.containsKey('preview') &&
              place['preview'].containsKey('source'))
          .map((place) {
        return {
          'name': place['name'].toString(),
          'description': place['description'].toString(),
          'imageUrl': place['preview']['source'].toString(),
        };
      }).toList();
    } else {
      throw Exception('Failed to load tourist attractions');
    }
  }
}
