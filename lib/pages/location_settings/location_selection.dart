import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hk_weather/data_type/location.dart';

import 'package:hk_weather/providers/location_provider.dart';

class LocationSettingsPage extends ConsumerStatefulWidget {
  const LocationSettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LocationSettingsPage> createState() =>
      _LocationSettingsPageState();
}

class _LocationSettingsPageState extends ConsumerState<LocationSettingsPage> {
  Location? current;

  @override
  Widget build(BuildContext context) {
    current = ref.watch(locationNotifierProvider).valueOrNull;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: Location.values.length,
          itemBuilder: (context, index) {
            final location = Location.values[index];
            return Card(
              clipBehavior: Clip.hardEdge,
              child: ListTile(
                title: Text(location2String(location)),
                subtitle: Text(location2Chinese(location)),
                trailing: Radio<Location>(
                  value: location,
                  groupValue: current,
                  onChanged: (value) {
                    ref
                        .read(locationNotifierProvider.notifier)
                        .changeLocation(location);
                    Navigator.pop(context);
                  },
                ),
                onTap: () {
                  ref
                      .read(locationNotifierProvider.notifier)
                      .changeLocation(location);
                  Navigator.pop(context);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
