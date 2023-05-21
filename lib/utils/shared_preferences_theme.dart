import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _selectedTheme;
  late Typography defaultTypography;
  late SharedPreferences prefs;

  ThemeData dark = ThemeModel().darkMode;

  ThemeData light = ThemeModel().lightMode;

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

class ThemeModel {
  final lightMode = ThemeData(
    primaryColor: Config().appColorLight,
    accentColor: Config().appColorLight,
    iconTheme: IconThemeData(color: Colors.white),
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Config().appColorLight,
    brightness: Brightness.light,
    primaryColorDark: Colors.grey[800],
    primaryColorLight: Colors.white,
    secondaryHeaderColor: Colors.grey[600],
    shadowColor: Colors.grey[300],
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Config().darkAppColor,
        fontSize: 20,
        fontFamily: 'Poppins',
      ),
      brightness: Brightness.light,
      color: Config().appColorLight,
      elevation: 3,
      centerTitle: true,
      titleSpacing: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      actionsIconTheme: IconThemeData(color: Colors.grey[900]),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.6,
          wordSpacing: 1,
          color: Config().darkAppColor,
        ),
      ),
    ),
    // textTheme: TextTheme(
    //   subtitle1: TextStyle(
    //       fontWeight: FontWeight.w500, fontSize: 16, color: Colors.grey[900]),
    // ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Config().darkAppColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[500],
    ),
  );
  final darkMode = ThemeData(
      primaryColor: Config().darkAppColor,
      accentColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: Config().darkBackgroundColor,
      brightness: Brightness.dark,
      primaryColorDark: Colors.grey[300],
      primaryColorLight: Config().darkAppColor,
      secondaryHeaderColor: Colors.grey[400],
      shadowColor: Config().darkAppColor,
      backgroundColor: Config().darkAppColor,
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        color: Config().darkAppColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actionsIconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            letterSpacing: -0.6,
            wordSpacing: 1,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      // textTheme: TextTheme(
      //   subtitle1: TextStyle(
      //       fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
      // ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[500],
      ));
}
