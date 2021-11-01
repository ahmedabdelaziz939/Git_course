import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    tabBarTheme: TabBarTheme(labelColor: Colors.black,labelStyle: TextStyle(fontSize: 20,)),
    // indicatorColor: , Decoration
    primarySwatch: Colors.deepPurple,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.indigo,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 10,
      // toolbarTextStyle: ,
      iconTheme:IconThemeData(color: Colors.black) ,
      backgroundColor: Colors.grey[200],
      centerTitle: true,
      titleTextStyle:
          const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 14),
      bodyText2: TextStyle(
        fontSize: 18,
      ),
      headline6: TextStyle(
        fontSize: 28,
      ),
    ),
  );
}
