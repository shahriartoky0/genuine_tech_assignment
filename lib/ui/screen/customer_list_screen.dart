import 'package:flutter/material.dart';

import 'customer_details_screen.dart';

class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Genuine Technology & Research Ltd',
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Customer List ',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.account_circle),
                      ),
                      title: Text('Email'),
                      subtitle: Text('Due'),
                      onLongPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomerDetailsScreen()));
                      },
                      trailing: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CustomerDetailsScreen()));
                        },
                        child: Text('Details'),
                      ),
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
