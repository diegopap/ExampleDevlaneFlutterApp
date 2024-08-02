import 'package:example_devlane_app/src/about/about_view.dart';
import 'package:example_devlane_app/src/locations/locations_view.dart';
import 'package:example_devlane_app/src/open_positions/open_positions_list_view.dart';
import 'package:example_devlane_app/src/settings/settings_view.dart';
import 'package:flutter/material.dart';

class NavigationView extends StatefulWidget {

  static const routeName = '/';

  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const AboutView(),
    const OpenPositionsListView(),
    const LocationsView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: switch(_currentIndex) {
          0 => const Text('About'),
          1 => const Text('Open Positions'),
          2 => const Text('Locations'),
          _ => throw UnimplementedError(),
        },
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Open Positions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Locations',
          ),
        ],
      ),
    );
  }
}