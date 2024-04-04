import 'package:flutter/material.dart';
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
                      controller: _passwordTEController,
                      obscureText: true,
                      textInputAction: TextInputAction.send,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        prefixIconColor: Colors.teal,
                        labelText: 'Password',
                      )),
                  SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            print(_emailTEController.text.trim());
                            print(_passwordTEController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CustomerListScreen(),
                                ));
                          },
                          child: Text('Log in')))
                ],
              ),
            ),
          ),
        ));
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
