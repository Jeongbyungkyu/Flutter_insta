import 'package:flutter/material.dart';

var theme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.pinkAccent,
  ),
  appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(
            color: Colors.black,
            size: 32
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
        )
    ),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.pinkAccent)
  ),
);