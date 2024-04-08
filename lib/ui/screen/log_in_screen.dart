import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/login_controller.dart';
import '../widget/snack_message.dart';
import 'customer_list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Genuine Technology & Research Ltd',
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 120),
                  Text(
                    'Customer Management ',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                      validator: (value) {
                        return isEmailValid(value);
                      },
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        prefixIconColor: Colors.teal,
                        labelText: 'Admin Email',
                      )),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return "Please Enter Your Password ";
                        }
                      },
                      controller: _passwordTEController,
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        prefixIconColor: Colors.teal,
                        labelText: 'Password',
                      )),
                  const SizedBox(height: 14),
                  SizedBox(
                      width: double.infinity,
                      child: GetBuilder<LoginController>(
                          builder: (loginController) {
                        return Visibility(
                          visible: loginController.logInProgress == false,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: ElevatedButton(
                              onPressed: _signIn, child: const Text('Log in')),
                        );
                      }))
                ],
              ),
            ),
          ),
        ));
  }

  // API request handle
  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      final response = await _loginController.signIn(
          email: _emailTEController.text.trim(),
          password: _passwordTEController.text);

      if (response) {
        clearTextFields();
        if (mounted) {
          showSnackMessage(context, _loginController.message);

          Get.offAll( CustomerListScreen());
        }
      }
    } else {
      if (mounted) {
        print(_loginController.message);
        showSnackMessage(context, _loginController.message, true);
      }
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }

  void clearTextFields() {
    _emailTEController.clear();
    _passwordTEController.clear();
  }

// validate Email Address
  String? isEmailValid(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
}
