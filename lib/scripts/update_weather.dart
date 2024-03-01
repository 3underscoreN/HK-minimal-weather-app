import 'package:http/http.dart' as http;
import 'dart:convert';

String _weatherurl =
    'https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=rhrread&lang=en';

Future<Map<String, dynamic>> updateWeather() async {
  final response = await http.get(Uri.parse(_weatherurl));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Weather load failed');
  }
}
