class CustomerListModel {
  int? success;
  bool? error;
  List<CustomerList>? customerList;
  PageInfo? pageInfo;

  CustomerListModel(
      {this.success, this.error, this.customerList, this.pageInfo});

  CustomerListModel.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    error = json['error'];
    if (json['CustomerList'] != null) {
      customerList = <CustomerList>[];
      json['CustomerList'].forEach((v) {
        customerList!.add(CustomerList.fromJson(v));
      });
    }
    pageInfo = json['PageInfo'] != null
        ? PageInfo.fromJson(json['PageInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Success'] = success;
    data['error'] = error;
    if (customerList != null) {
      data['CustomerList'] = customerList!.map((v) => v.toJson()).toList();
    }
    if (pageInfo != null) {
      data['PageInfo'] = pageInfo!.toJson();
    }
    return data;
  }
}

class CustomerList {
  int? id;
  String? name;
  String? email;
  String? primaryAddress;
  String? secoundaryAddress;
  String? notes;
  String? phone;
  String? custType;
  String? parentCustomer;
  String? imagePath;
  double? totalDue;
  String? lastSalesDate;
  String? lastInvoiceNo;
  String? lastSoldProduct;
  int? totalSalesValue;
  int? totalSalesReturnValue;
  int? totalAmountBack;
  int? totalCollection;
  String? lastTransactionDate;
  Null? clinetCompanyName;

  CustomerList(
      {this.id,
        this.name,
        this.email,
        this.primaryAddress,
        this.secoundaryAddress,
        this.notes,
        this.phone,
        this.custType,
        this.parentCustomer,
        this.imagePath,
        this.totalDue,
        this.lastSalesDate,
        this.lastInvoiceNo,
        this.lastSoldProduct,
        this.totalSalesValue,
        this.totalSalesReturnValue,
        this.totalAmountBack,
        this.totalCollection,
        this.lastTransactionDate,
        this.clinetCompanyName});

  CustomerList.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    email = json['Email'];
    primaryAddress = json['PrimaryAddress'];
    secoundaryAddress = json['SecoundaryAddress'];
    notes = json['Notes'];
    phone = json['Phone'];
    custType = json['CustType'];
    parentCustomer = json['ParentCustomer'];
    imagePath = json['ImagePath'];
    totalDue = json['TotalDue'];
    lastSalesDate = json['LastSalesDate'];
    lastInvoiceNo = json['LastInvoiceNo'];
    lastSoldProduct = json['LastSoldProduct'];
    totalSalesValue = json['TotalSalesValue'];
    totalSalesReturnValue = json['TotalSalesReturnValue'];
    totalAmountBack = json['TotalAmountBack'];
    totalCollection = json['TotalCollection'];
    lastTransactionDate = json['LastTransactionDate'];
    clinetCompanyName = json['ClinetCompanyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Email'] = email;
    data['PrimaryAddress'] = primaryAddress;
    data['SecoundaryAddress'] = secoundaryAddress;
    data['Notes'] = notes;
    data['Phone'] = phone;
    data['CustType'] = custType;
    data['ParentCustomer'] = parentCustomer;
    data['ImagePath'] = imagePath;
    data['TotalDue'] = totalDue;
    data['LastSalesDate'] = lastSalesDate;
    data['LastInvoiceNo'] = lastInvoiceNo;
    data['LastSoldProduct'] = lastSoldProduct;
    data['TotalSalesValue'] = totalSalesValue;
    data['TotalSalesReturnValue'] = totalSalesReturnValue;
    data['TotalAmountBack'] = totalAmountBack;
    data['TotalCollection'] = totalCollection;
    data['LastTransactionDate'] = lastTransactionDate;
    data['ClinetCompanyName'] = clinetCompanyName;
    return data;
  }
}

class PageInfo {
  int? pageNo;
  int? pageSize;
  int? pageCount;
  int? totalRecordCount;

  PageInfo({this.pageNo, this.pageSize, this.pageCount, this.totalRecordCount});

  PageInfo.fromJson(Map<String, dynamic> json) {
    pageNo = json['PageNo'];
    pageSize = json['PageSize'];
    pageCount = json['PageCount'];
    totalRecordCount = json['TotalRecordCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PageNo'] = pageNo;
    data['PageSize'] = pageSize;
    data['PageCount'] = pageCount;
    data['TotalRecordCount'] = totalRecordCount;
    return data;
  }
}
