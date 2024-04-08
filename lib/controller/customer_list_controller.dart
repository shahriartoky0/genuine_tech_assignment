import 'package:get/get.dart';
import 'package:genuine_tech_assignment/data/models/customer_list_model.dart';
import 'package:genuine_tech_assignment/data/network_caller/network_caller.dart';
import 'package:genuine_tech_assignment/data/network_caller/network_response.dart';
import 'package:genuine_tech_assignment/data/utilities/urls.dart';

class CustomerListController extends GetxController {
  var customerListModel = CustomerListModel().obs;
  var customerListLoader = false.obs;
  var totalPages = 20.obs;
  var currentPage = 0.obs;
  var selectedPages = <bool>[].obs;

  @override
  void onInit() {
    loadCustomerList();
    super.onInit();
  }

  Future<void> loadCustomerList(
      {String pageNumber = '1',
        String totalNumberOfPage = '20',
        String sortBy = 'Balance'}) async {
    customerListLoader.value = true;
    final NetworkResponse response = await NetworkCaller().getRequest(
        URL.customerListUrl(
            pageNo: pageNumber, pageSize: totalNumberOfPage, sort: sortBy));
    customerListLoader.value = false;
    if (response.isSuccess) {
      customerListModel.value =
          CustomerListModel.fromJson(response.jsonResponse!);
      totalPages.value = customerListModel.value.pageInfo?.pageSize ?? 20;
      selectedPages.assignAll(List.generate(totalPages.value, (_) => false));
    } else {
      print(response.errorMessage);
    }
  }

  void onPageChange(int index) {
    currentPage.value = index + 1;
    loadCustomerList(pageNumber: currentPage.value.toString());
    updateSelectedPage(index);
  }

  void updateSelectedPage(int index) {
    selectedPages.assignAll(List.generate(totalPages.value, (i) => i == index));
  }
}
