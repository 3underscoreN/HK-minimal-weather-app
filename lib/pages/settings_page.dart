import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hk_weather/providers/location_provider.dart';
import 'package:hk_weather/data_type/location.dart';

import 'package:hk_weather/pages/location_settings/location_selection.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // @override
  // void initState() {
  //   super.initState();
  // }

  // Future<void> ref.read(_location.notifier)(Location location) async {
  //   final SharedPreferences prefs = await _prefs;
  //   final SharedPreferencesWrapper sharedPreferencesWrapper =
  //       SharedPreferencesWrapper(sharedPreferences: prefs);
  //   sharedPreferencesWrapper.setLocation(location);
  // }

  @override
  Widget build(BuildContext context) {
    final Location? location = ref.watch(locationNotifierProvider).valueOrNull;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Location'),
                subtitle: Text('Currently set to: ${location2String(location)}'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LocationSettingsPage(),
                    ),
                  );
                },
              )
            ),
          ),
        ],
      ),
    );
  }
}
