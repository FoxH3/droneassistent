import 'package:flutter/material.dart';

class Palette with ChangeNotifier {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xE6333333),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFF6FDFF), // dark=weiß - light=weiß
      onPrimary: Color(0xE6333333), // dark=grau - light=grau
      secondary: Color(0xE6333333), //dark=grau - light=light
      tertiary: Color(0xFFF6FDFF), //dark=weiß - light=grau
      surfaceVariant: Color.fromARGB(255, 133, 133, 133), //Unbenutzt
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: Color(0xFFF6FDFF)), // Main Menu Button
      headlineSmall: TextStyle(
        color: Color(0xE6333333),
      ), // Überschrift (appbar)
      titleMedium: TextStyle(
        color: Color(0xFFF6FDFF),
      ), // Switch Labeltext
      titleSmall: TextStyle(
        color: Color(0xFFF6FDFF),
      ), // Sliding Panel
      labelMedium: TextStyle(
        color: Color(0xFFF6FDFF),
      ), // Sliding Panel
      bodyLarge: TextStyle(
        color: Color(0xFFF6FDFF),
      ), // Haupttext
      bodyMedium: TextStyle(
        color: Colors.black,
      ), // Haupttext2 (Light = Weiß - Dark = Black)
      bodySmall: TextStyle(
        color: Colors.black,
      ),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF6FDFF),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFF6FDFF), // dark=weiß - light=weiß
      onPrimary: Color(0xE6333333), // dark=grau - light=grau
      secondary: Color(0xFFF6FDFF), //dark=grau - light=weiß
      tertiary: Color(0xE6333333), // dark=weiß - light=grau
      surfaceVariant: Color(0xFFF6FDFF), //Unbenutzt
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: Color(0xE6333333)), // Main Menu Button
      headlineSmall: TextStyle(
        color: Color(0xFFF6FDFF),
      ), // Überschrift (appbar)
      titleMedium: TextStyle(
        color: Color(0xE6333333),
      ), // Switch Labeltext
      titleSmall: TextStyle(
        color: Color(0xFFF6FDFF),
      ), // Sliding Panel
      labelMedium: TextStyle(
        color: Color(0xFFF6FDFF),
      ), // Sliding Panel
      bodyLarge: TextStyle(
        color: Color(0xE6333333),
      ), // Haupttext (Light = Black - Dark = Weiß)
      bodyMedium: TextStyle(
        color: Color(0xFFF6FDFF),
      ), // Haupttext2 (Light = Weiß - Dark = Black)
      bodySmall: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
