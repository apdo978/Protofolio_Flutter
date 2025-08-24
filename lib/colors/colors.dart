// Theme Colors
import 'package:flutter/material.dart';

// Light Mode Colors
const lightBackgroundColor = Color(0xFFFFFFFF);
const lightTextColor = Color(0xFF000000);
const lightSecondaryColor = Color(0xFF336ecc);
const lightCardColor = Color(0xFFF5F5F5);
const lightBorderColor = Color(0xFFE0E0E0);

// Dark Mode Colors
const darkBackgroundColor = Color(0xFF0D1117);
const darkTextColor = Color(0xFFF0F6FC);
const darkSecondaryColor = Color(0xFF58A6FF);
const darkCardColor = Color(0xFF161B22);
const darkBorderColor = Color(0xFF30363D);

// Dynamic colors based on theme
Color backgroundColor = lightBackgroundColor;
Color textColor = lightTextColor;
Color secondaryColor = lightSecondaryColor;
Color cardColor = lightCardColor;
Color borderColor = lightBorderColor;

void updateColors(bool isDarkMode) {
  if (isDarkMode) {
    backgroundColor = darkBackgroundColor;
    textColor = darkTextColor;
    secondaryColor = darkSecondaryColor;
    cardColor = darkCardColor;
    borderColor = darkBorderColor;
  } else {
    backgroundColor = lightBackgroundColor;
    textColor = lightTextColor;
    secondaryColor = lightSecondaryColor;
    cardColor = lightCardColor;
    borderColor = lightBorderColor;
  }
}
