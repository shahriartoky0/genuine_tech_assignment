import 'package:flutter/material.dart';
import '../widget/build_customer_details_text_style.dart';

class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genuine Technology & Research Ltd'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Customer Details ',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              Card(
                elevation: 10,
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Image.network(
                            'https://img.lovepik.com/free-png/20210926/lovepik-cartoon-customer-service-avatar-png-image_401451024_wh1200.png',
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(children: [
                              buildCustomerDetail(
                                  'Name', 'Golam Shahriar Toky'),
                              buildCustomerDetail('Email',
                                  'tokyshahriar5sdssdsdkjhfsjdkfhksjdfh55@gmail.com'),
                              buildCustomerDetail('Phone Number', ''),
                              buildCustomerDetail('Customer Type', ''),
                              buildCustomerDetail('Total Due', ''),
                              buildCustomerDetail('Last Transaction date', ''),
                              buildCustomerDetail('Parent Customer', ''),
                              buildCustomerDetail('Client Company Name', ''),
                            ]),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                      width: double.infinity,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
