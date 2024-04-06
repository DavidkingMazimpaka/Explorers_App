import 'dart:convert';
import 'package:helloworld/models/destinations.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://api.opentripmap.com/0.1/en/places';
  final String apiKey =
      '5ae2e3f221c38a28845f05b6b36b94feeea7a570f166f48d2526c157'; // Replace with your actual API key

  Future<List<Destination>> fetchNearbyDestinations(
      double lat, double lon) async {
    final uri = Uri.parse('$baseUrl/radius').replace(queryParameters: {
      'radius': '10000', // Example radius
      'lon': lon.toString(),
      'lat': lat.toString(),
      'apikey': apiKey,
    });

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['features'];
      return data.map((json) => Destination.fromApiJson(json)).toList();
    } else {
      throw Exception('Failed to load destinations: ${response.reasonPhrase}');
    }
  }
}
