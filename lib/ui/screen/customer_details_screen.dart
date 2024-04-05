import 'package:flutter/material.dart';
import 'package:genuine_tech_assignment/data/models/customer_list_model.dart';
import '../../data/utilities/urls.dart';
import '../widget/build_customer_details_text_style.dart';
import '../widget/current_app_bar.dart';

class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({super.key, required this.customerDetails});

  final CustomerList customerDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CurrentAppBar(),
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
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Image.network(
                            '${URL.baseImageUrl}/${customerDetails?.imagePath.toString() ?? URL.imagePlaceHolder}',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(children: [
                              buildCustomerDetail(
                                  'Name', customerDetails?.name ?? 'N/A'),
                              buildCustomerDetail(
                                  'Email', customerDetails?.email ?? 'N/A'),
                              buildCustomerDetail('Phone Number',
                                  customerDetails?.phone ?? 'N/A'),
                              buildCustomerDetail('Address',
                                  customerDetails?.primaryAddress ?? 'N/A'),
                              buildCustomerDetail('Customer Type',
                                  customerDetails?.custType ?? 'N/A'),
                              buildCustomerDetail(
                                  'Total Due',
                                  customerDetails?.totalDue.toString() ??
                                      'N/A'),
                              buildCustomerDetail(
                                  'Last Transaction date',
                                  customerDetails?.lastTransactionDate ??
                                      'N/A'),
                              buildCustomerDetail('Parent Customer',
                                  customerDetails?.parentCustomer ?? 'N/A'),
                              buildCustomerDetail('Client Company Name',
                                  customerDetails?.clinetCompanyName ?? 'N/A'),
                            ]),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
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
