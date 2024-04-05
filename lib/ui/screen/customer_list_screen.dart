import 'package:flutter/material.dart';
import 'package:genuine_tech_assignment/data/models/customer_list_model.dart';
import 'package:genuine_tech_assignment/data/network_caller/network_caller.dart';
import 'package:genuine_tech_assignment/data/network_caller/network_response.dart';
import 'package:genuine_tech_assignment/data/utilities/urls.dart';
import 'package:number_paginator/number_paginator.dart';
import '../widget/current_app_bar.dart';
import 'customer_details_screen.dart';

class CustomerListScreen extends StatefulWidget {
  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  CustomerListModel customerListModel = CustomerListModel();

  bool customerListLoader = false;

  //page Indications
  late final totalPages = customerListModel.pageInfo?.pageSize ?? 20;

  late int currentPage = 0;

  //page indication Ends

  @override
  void initState() {
    _loadCustomerList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CurrentAppBar(),
          SizedBox(height: 20),
          Text(
            'Customer List ',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Visibility(
            visible: customerListLoader == false,
            replacement: const Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16,50,16,50),
                child: CircularProgressIndicator(),
              ),
            ),
            child: Expanded(
              child: ListView.builder(
                  itemCount: customerListModel.customerList?.length ?? 0,
                  itemBuilder: (context, index) {
                    if (customerListModel.customerList == null) {
                      customerListLoader = true;
                    }

                    final customer = customerListModel.customerList?[index];
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              '${URL.baseImageUrl}/${customer?.imagePath.toString() ?? URL.imagePlaceHolder}',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: RichText(
                          text: TextSpan(
                            text: customer?.name ?? 'Not Available',
                            style: TextStyle(
                              color: customer?.name != null
                                  ? Colors.black
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            text: customer?.totalDue != null
                                ? customer!.totalDue!.toString()
                                : 'No Available Information',
                            style: TextStyle(
                              color: () {
                                if (customer?.totalDue != null) {
                                  return customer!.totalDue! > 0
                                      ? Colors.red
                                      : Colors.teal;
                                } else {
                                  return Colors.grey;
                                }
                              }(),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onLongPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomerDetailsScreen(
                                        customerDetails: customer!,
                                      )));
                        },
                        trailing: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CustomerDetailsScreen(
                                        customerDetails: customer!)));
                          },
                          child: Text('Details'),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          NumberPaginator(
            numberPages: totalPages,
            onPageChange: (index) {
              currentPage = index + 1;
              _loadCustomerList(pageNumber: currentPage.toString());

              setState(() {});
            },
          )
        ],
      )),
    );
  }

  Future<void> _loadCustomerList(
      {String pageNumber = '1',
      String totalNumberOfPage = '20',
      String sortBy = 'Balance'}) async {
    customerListLoader = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response = await NetworkCaller().getRequest(
        URL.customerListUrl(
            pageNo: pageNumber, pageSize: totalNumberOfPage, sort: sortBy));
    customerListLoader = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {

      customerListModel = CustomerListModel.fromJson(response.jsonResponse!);

    } else {
      print(response.errorMessage);
    }
  }
}
