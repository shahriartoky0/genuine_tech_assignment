import 'package:flutter/material.dart';
import 'package:genuine_tech_assignment/controller/auth_controller.dart';
import 'package:genuine_tech_assignment/controller/customer_list_controller.dart';
import 'package:genuine_tech_assignment/controller/login_controller.dart';
import 'package:genuine_tech_assignment/ui/Screen/log_in_screen.dart';
import 'package:genuine_tech_assignment/ui/screen/customer_list_screen.dart';
import 'package:genuine_tech_assignment/ui/screen/splash_screen.dart';
import 'package:get/get.dart';

class CustomerManagementApp extends StatelessWidget {
  const CustomerManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.teal,
          primarySwatch: Colors.teal,
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600)),
          inputDecorationTheme: const InputDecorationTheme(
            fillColor: Colors.white30,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent)),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16))),
          textTheme: const TextTheme(
              displayMedium: TextStyle(
                  fontSize: 26,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700))),
      initialBinding: ControllerBinder(),
    );
  }
}

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(LoginController());
    // Get.put(CustomerListController());
  }
}
