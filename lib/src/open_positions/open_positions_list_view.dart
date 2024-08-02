import 'package:example_devlane_app/src/data/data.dart';
import 'package:flutter/material.dart';
import 'open_position_details_view.dart';

class OpenPositionsListView extends StatelessWidget {
  
  const OpenPositionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'restorationId',
        itemCount: openPositions.length,
        itemBuilder: (BuildContext context, int index) {
          final item = openPositions[index];

          return ListTile(
            title: Text(item.title),
            leading: Image.asset(
              'assets/images/devlane_logo.png',
              height: 40.0,
              ),
            onTap: () {
              // Navigate to the details page. If the user leaves and returns to
              // the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(
                context,
                OpenPositionDetailsView.routeName, 
                arguments: item.id
              );
            }
          );
        },
        
      );
  }
}
