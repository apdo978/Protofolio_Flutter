import 'package:flutter/material.dart';
import '../colors/colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get themeData {
    return _isDarkMode ? _darkTheme : _lightTheme;
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    updateColors(_isDarkMode);
    notifyListeners();
  }

  void setTheme(bool isDark) {
    _isDarkMode = isDark;
    updateColors(_isDarkMode);
    notifyListeners();
  }

  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: lightBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: lightBackgroundColor,
      foregroundColor: lightTextColor,
      elevation: 0,
      iconTheme: IconThemeData(color: lightTextColor),
    ),
    cardTheme: CardThemeData(
      color: lightCardColor,
      elevation: 2,
      shadowColor: Colors.grey.withOpacity(0.3),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: lightTextColor),
      bodyMedium: TextStyle(color: lightTextColor),
      titleLarge: TextStyle(color: lightTextColor),
    ),
    iconTheme: IconThemeData(color: lightTextColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightSecondaryColor,
        foregroundColor: lightBackgroundColor,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: lightTextColor,
        side: BorderSide(color: lightSecondaryColor),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightCardColor,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: lightBorderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: lightBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: lightSecondaryColor),
      ),
      labelStyle: TextStyle(color: lightTextColor.withOpacity(0.8)),
      hintStyle: TextStyle(color: lightTextColor.withOpacity(0.6)),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: lightCardColor,
      labelStyle: TextStyle(color: lightTextColor),
      side: BorderSide(color: lightBorderColor),
    ),
    dividerColor: lightBorderColor,
    shadowColor: Colors.grey.withOpacity(0.3),
  );

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: darkBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: darkBackgroundColor,
      foregroundColor: darkTextColor,
      elevation: 0,
      iconTheme: IconThemeData(color: darkTextColor),
    ),
    cardTheme: CardThemeData(
      color: darkCardColor,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.3),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: darkTextColor),
      bodyMedium: TextStyle(color: darkTextColor),
      titleLarge: TextStyle(color: darkTextColor),
    ),
    iconTheme: IconThemeData(color: darkTextColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkSecondaryColor,
        foregroundColor: darkBackgroundColor,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: darkTextColor,
        side: BorderSide(color: darkSecondaryColor),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkCardColor,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: darkBorderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: darkBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: darkSecondaryColor),
      ),
      labelStyle: TextStyle(color: darkTextColor.withOpacity(0.8)),
      hintStyle: TextStyle(color: darkTextColor.withOpacity(0.6)),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: darkCardColor,
      labelStyle: TextStyle(color: darkTextColor),
      side: BorderSide(color: darkBorderColor),
    ),
    dividerColor: darkBorderColor,
    shadowColor: Colors.black.withOpacity(0.5),
  );
}
