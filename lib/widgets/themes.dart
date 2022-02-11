import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creameColor,
      buttonColor: darkBluisColor,
      accentColor: darkBluisColor,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          foregroundColor: Colors.black
          // textTheme: Theme.of(context).textTheme
          )
      // primaryTextTheme: GoogleFonts.latoTextTheme()
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreameColor,
      buttonColor: lightBluisColor,
      accentColor: Colors.white,
      appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          foregroundColor: Colors.black
          // textTheme: Theme.of(context).textTheme
          ));

  // Colors

  static Color creameColor = Color(0xfff5f5f5);
  static Color darkCreameColor = Vx.gray900;
  static Color darkBluisColor = Color(0xff403b58);
  static Color lightBluisColor = Vx.indigo500;
}
