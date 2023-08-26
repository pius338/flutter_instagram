import 'package:flutter/material.dart';

var customTheme = ThemeData(
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.grey,
    )
  ),
  iconTheme: IconThemeData(color: Colors.blue),
  appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 1,
      actionsIconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 20
    )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedIconTheme: IconThemeData(color: Colors.grey),
    selectedIconTheme: IconThemeData(color: Colors.black),
  ),
);