import 'package:flutter/material.dart';

import 'customerListScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
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
                    decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  prefixIconColor: Colors.teal,
                  labelText: 'Admin Email',
                )),
                SizedBox(height: 10),
                TextFormField(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CustomerListScreen(),
                              ));
                        },
                        child: Text('Log in ')))
              ],
            ),
          ),
        ));
  }
}
