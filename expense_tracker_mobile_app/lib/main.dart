import 'package:flutter/material.dart';
import 'package:expense_tracker_mobile_app/expenses.dart';
import 'package:flutter/services.dart';

// we need the services.dart file to find some functinalities which help us to lock the orientation of the screen like fixed portrait or landscape mode
var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 56, 181));
// adding a dark mode to our app
var kDarkscheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 5, 99, 125),
);
void main() {
  // Locking the screen orientaition to portrait mode
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Removes debug banner
    // we can use a darkTheme constructor to use the dark mode
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kDarkscheme,
      cardTheme: CardTheme().copyWith(
          color: kDarkscheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: kDarkscheme.primaryContainer,
        foregroundColor: kDarkscheme.onPrimaryContainer,
      )),
      textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: kDarkscheme.onSecondaryContainer,
            fontSize: 16,
          )),
    ),
    theme: ThemeData().copyWith(
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      cardTheme: CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: kColorScheme.primaryContainer,
      )),
      textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16,
          )),
    ),
    themeMode: ThemeMode
        .system, // check the user system setting for dark or light mode and then apply that setting
    home: Expenses(),
  ));
  // });
}
