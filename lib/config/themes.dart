import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 245, 244, 244),
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: GoogleFonts.robotoMono(
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  brightness: Brightness.light,
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  textTheme: GoogleFonts.robotoMonoTextTheme(),
);

final ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 38, 38, 38),
    iconTheme: const IconThemeData(color: Color.fromARGB(255, 252, 249, 249)),
    titleTextStyle: GoogleFonts.robotoMono(
      textStyle: const TextStyle(
        color: Color.fromARGB(255, 252, 249, 249),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.black,
  brightness: Brightness.dark,
  textTheme: GoogleFonts.robotoMonoTextTheme(),
);
