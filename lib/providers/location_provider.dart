import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hk_weather/data_type/location.dart';
import 'package:hk_weather/data_type/shared_preferences_wrapper.dart';

// final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
//   throw UnimplementedError();
// });

class LocationNotifier extends AsyncNotifier<Location> {
  Future<Location> getLocation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final SharedPreferencesWrapper sharedPreferencesWrapper = SharedPreferencesWrapper(sharedPreferences: sharedPreferences);
    final Location? location = sharedPreferencesWrapper.fetchLocation();
    if (location == null) {
      throw Exception('Location not found');
    }
    return location;
  }

  @override
  Future<Location> build() async {
    return getLocation();
  }

  Future<void> changeLocation(Location location) async {
    state = const AsyncValue.loading();
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final SharedPreferencesWrapper sharedPreferencesWrapper = SharedPreferencesWrapper(sharedPreferences: sharedPreferences);
    sharedPreferencesWrapper.setLocation(location);
    state = AsyncValue.data(await getLocation());
  }
}

final locationNotifierProvider = AsyncNotifierProvider<LocationNotifier, Location>(() {
  return LocationNotifier();
});



