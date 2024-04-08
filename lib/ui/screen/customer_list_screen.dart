import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:genuine_tech_assignment/data/utilities/urls.dart';
import 'package:number_paginator/number_paginator.dart';
import '../../controller/customer_list_controller.dart';
import '../widget/current_app_bar.dart';
import 'customer_details_screen.dart';

class CustomerListScreen extends StatelessWidget {
  final CustomerListController controller = Get.put(CustomerListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CurrentAppBar(),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Customer List ',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            Expanded(
              child: Obx(() {
                return Visibility(
                  visible: !controller.customerListLoader.value,
                  replacement: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: controller
                            .customerListModel.value.customerList?.length ??
                        0,
                    itemBuilder: (context, index) {
                      final customer = controller
                          .customerListModel.value.customerList?[index];
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
                            Get.to(CustomerDetailsScreen(
                              customerDetails: customer!,
                            ));
                          },
                          trailing: OutlinedButton(
                            onPressed: () {
                              Get.to(CustomerDetailsScreen(
                                customerDetails: customer!,
                              ));
                            },
                            child: const Text('Details'),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
            Obx(() {
              return Visibility(
                visible: !controller.customerListLoader.value,
                replacement: const SizedBox.shrink(),
                child: Container(
                  height: 40, // Set the height of the container
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.totalPages.value,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => controller.onPageChange(index),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [

                              Icon(Icons.circle,
                                  color:
                                      controller.currentPage.value == index + 1
                                          ? Colors.blue
                                          : Colors.grey),
                              Text('${index+1}')
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
