import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hk_weather/data_type/location.dart';

import 'package:hk_weather/providers/location_provider.dart';

import 'package:hk_weather/themes/light_theme.dart';
import 'package:hk_weather/themes/dark_theme.dart';

import 'package:hk_weather/pages/settings_page.dart';

import 'package:hk_weather/scripts/update_weather.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: whiteTheme,
      darkTheme: darkTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  bool updatingWeather = false;
  int? temperature;
  int? humidity;
  String? lastUpdate;
  bool hasErrorWhenUpdate = false;

  @override
  void initState() {
    super.initState();
    updateWeatherData().then((_) {
      setState(() {});
    });
  }

  Future<void> updateWeatherData() async {
    hasErrorWhenUpdate = false;
    Map<String, dynamic> rawData = await updateWeather();
    String loc =
        location2String(ref.read(locationNotifierProvider).valueOrNull);
    if (loc == "null") {
      hasErrorWhenUpdate = true;
      return;
    }
    var temperatureAll = rawData['temperature']['data'];
    for (var ti in temperatureAll) {
      if (ti['place'] == loc) {
        temperature = ti['value'];
        break;
      }
    }
    humidity = rawData['humidity']['data'][0]['value'];
    lastUpdate = rawData['temperature']['recordTime'].substring(0, 10) +
        ' ' +
        rawData['temperature']['recordTime'].substring(11, 16);
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<Location> location = ref.watch(locationNotifierProvider);
    return RefreshIndicator(
      displacement: 8.0,
      onRefresh: () async {
        await updateWeatherData();
        setState(() {});
      },
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Hong Kong Weather'),
            leading: IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () async {
                await updateWeatherData();
                setState(() {});
              },
            ),
            floating: true,
            pinned: true,
            stretch: true,
            snap: true,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Theme.of(context).brightness == Brightness.light
                  ? Image.asset(
                      'assets/images/hk_day.jpg',
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/hk_night.jpg',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Builder(
                    builder: (BuildContext context) {
                      return location.when(
                        data: (Location? loc) => Text(
                          location2String(loc),
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        error: (error, _) => const Text(
                          'Location unknown',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ), // Location not found
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                      );
                    },
                  ),
                ),
                lastUpdate != null
                    ? Container(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        child: Text(
                          'Last update: $lastUpdate',
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Divider(),
                ),
                // Container(
                //   padding: const EdgeInsets.all(8.0),
                //   child: const Text(
                //     'Temperature',
                //     style: TextStyle(
                //       fontSize: 25.0,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                temperature != null
                    ? Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '$temperature °C',
                              style: const TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '$humidity %',
                                style: const TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                // updatingWeather
                //     ? const Center(child: CircularProgressIndicator())
                //     : ElevatedButton(
                //         onPressed: () async {
                //           setState(() {
                //             updatingWeather = true;
                //           });
                //           await updateWeatherData();
                //           setState(() {
                //             updatingWeather = false;
                //           });
                //         },
                //         child: const Text('Update weather'),
                //       ),
                hasErrorWhenUpdate
                    ? Container(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'Please select a location before attempting an update!',
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : const SizedBox.shrink(),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Divider(),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Rainfall',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: ListTile(
                      title: const Text('Settings'),
                      leading: const Icon(Icons.settings),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
