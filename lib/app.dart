import 'package:flutter/material.dart';
import 'package:genuine_tech_assignment/ui/Screen/log_in_screen.dart';

class CustomerManagementApp extends StatelessWidget {
  const CustomerManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.teal,
          primarySwatch: Colors.teal,
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600)),
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
                  fontWeight: FontWeight.w700))),
    );
  }
}
