import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _selectedTheme;
  late Typography defaultTypography;
  late SharedPreferences prefs;

  ThemeData light = ThemeData.light().copyWith(
    accentColor: const Color(0xFF206BE4),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.grey.shade600),
    ),
    cardColor: Colors.white,
    shadowColor: Colors.grey.withOpacity(0.2),
    scaffoldBackgroundColor: Colors.white,
  );

  ThemeData dark = ThemeData.dark().copyWith(
    accentColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: const Color(0xFF303030),
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.grey.shade400),
    ),
    cardColor: Colors.black,
    shadowColor: Colors.transparent,
    scaffoldBackgroundColor: const Color(0xFF303030),
  );

  ThemeProvider(bool darkThemeOn) {
    _selectedTheme = darkThemeOn ? dark : light;
  }

  Future<void> swapTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      await prefs.setBool("darkTheme", false);
    } else {
      _selectedTheme = dark;
      await prefs.setBool("darkTheme", true);
    }

    notifyListeners();
  }

  ThemeData getTheme() => _selectedTheme;
}
