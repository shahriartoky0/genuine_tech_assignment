import 'package:flutter/material.dart';
import 'package:genuine_tech_assignment/controller/auth_controller.dart';
import 'package:genuine_tech_assignment/ui/Screen/log_in_screen.dart';
import 'package:genuine_tech_assignment/ui/screen/customer_list_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToLogin();
    super.initState();
  }

  void goToLogin() async {
    final bool isLoggedIn = await Get.find<AuthController>().checkAuthState();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
    ).then((value) {
      Get.offAll(isLoggedIn ?  CustomerListScreen() : const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: 1,
          child: Text(
            'Genuine Technology and Research Ltd',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 24, // Adjust the font size as needed
              fontWeight: FontWeight.bold, // Adjust the font weight as needed
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
