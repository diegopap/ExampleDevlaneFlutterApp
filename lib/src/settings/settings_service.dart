import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {

    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Try reading data from the 'ThemeMode' key. If it doesn't exist, returns 0.
    final int themeMode = prefs.getInt('ThemeMode') ?? 0;

    switch(themeMode) {
      case 1 :
        return ThemeMode.light;
      case 2 :
        return ThemeMode.dark;
    }
    return ThemeMode.system;

  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {

    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save an String value to 'ThemeMode' key.
    await prefs.setInt('ThemeMode', theme.index);

  }
}
