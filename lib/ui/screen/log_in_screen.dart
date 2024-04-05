import 'package:flutter/material.dart';
import 'package:genuine_tech_assignment/controller/auth_controller.dart';
import 'package:genuine_tech_assignment/data/models/user_details_model.dart';
import 'package:genuine_tech_assignment/data/network_caller/network_caller.dart';
import 'package:genuine_tech_assignment/data/utilities/urls.dart';
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
  bool logInProgress = false;

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
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 120),
                  Text(
                    'Customer Management ',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 25),
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
                  SizedBox(height: 10),
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
                      child: Visibility(
                        visible: logInProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                            onPressed: _signIn, child: Text('Log in')),
                      ))
                ],
              ),
            ),
          ),
        ));
  }

  // API request handle
  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      if (mounted) {
        logInProgress = true;
        setState(() {});
      }
      final response = await NetworkCaller().getRequest(URL.loginUrl(
          _emailTEController.text.trim(), _passwordTEController.text));
      if (mounted) {
        logInProgress = false;
        setState(() {});
      }
      if (response.isSuccess) {
        final dynamic token = response.jsonResponse?['Token'];
        final dynamic userDetailsJson = response.jsonResponse;
        if (token != null && userDetailsJson != null) {
          final userDetails = UserDetails.fromJson(userDetailsJson);
          await AuthController.saveUserInformation(token, userDetails);
          clearTextFields();
          if (mounted) {
            showSnackMessage(context, 'Login Successful');
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomerListScreen(),
                ));
          }
        }
      } else {
        if (response.statusCode == 401) {
          if (mounted) {
            showSnackMessage(context, 'Incorrect Username or Password', true);
          }
        } else {
          if (mounted) {
            showSnackMessage(context, 'An Error Occurred', true);
          }
        }
      }
    }
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

  void clearTextFields() {
    _emailTEController.clear();
    _passwordTEController.clear();
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
