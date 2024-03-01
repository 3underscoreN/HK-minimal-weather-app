import 'package:shared_preferences/shared_preferences.dart';
import 'package:hk_weather/data_type/location.dart';

class SharedPreferencesWrapper {
  final SharedPreferences sharedPreferences;

  SharedPreferencesWrapper({
    required this.sharedPreferences,
  });

  Location? fetchLocation() {
    final String? location = sharedPreferences.getString('location');
    if (location == null) {
      return null;
    }
    return string2Location(location);
  }

  void setLocation(Location newLoc) {
    final String location = location2String(newLoc);
    if (location == "null") {
      throw Exception('Invalid location');
    }
    sharedPreferences.setString('location', location);
  }
}