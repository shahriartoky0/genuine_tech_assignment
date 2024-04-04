import 'package:flutter/material.dart';
import 'package:genuine_tech_assignment/ui/widget/style.dart';

Widget buildCustomerDetail(String label, String value) {
  return Row(
    children: [
      Text(
        '$label: ',
        style: AppTextStyles.customerCredentialTextStyle(),
      ),
      Expanded(
        child: Text(
          value,
          style: AppTextStyles.customerDetailsTextStyle(),
        ),
      ),
    ],
  );
}