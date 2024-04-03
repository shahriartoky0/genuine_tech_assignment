import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screen/loginScreen.dart';

class CustomerManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      theme: ThemeData(
          primaryColor: Colors.teal,
          primarySwatch: Colors.teal,
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white30,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent)),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16))),
          textTheme: TextTheme(
              displayMedium: TextStyle(
                  fontSize: 26,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600))),
    );
  }
}
