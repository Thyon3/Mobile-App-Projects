import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:expense_tracker_mobile_app/screen/Places_list_screen.dart';
import 'package:expense_tracker_mobile_app/widget/places_list.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 102, 6, 247),
  brightness: Brightness.dark,
);

final theme = ThemeData().copyWith(
  colorScheme: colorScheme,
  scaffoldBackgroundColor: colorScheme.background,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold,
    ),
  ),
);

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      theme: theme,
      title: 'Your Favourite places',
      home: PlacesListScreen(),
    );
  }
}
