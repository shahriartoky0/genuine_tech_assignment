class URL {
  static const String _baseUrl = "https://www.pqstec.com/InvoiceApps/Values/";

  static String loginUrl(String email, String password) =>
      // '$_baseUrl/updateTaskStatus/$taskId/$status';
      '${_baseUrl}LogIn?UserName=$email&Password=$password&ComId=1';

  static const String baseImageUrl = "https://www.pqstec.com/InvoiceApps";
  static const String imagePlaceHolder =
      "https://img.lovepik.com/free-png/20210926/lovepik-cartoon-customer-service-avatar-png-image_401451024_wh1200.png";

  // static const String customerListUrl  = "${_baseUrl}GetCustomerList?searchquery&pageNo=1&pageSize=20&SortyBy=Balance";
  static String customerListUrl(
          { String pageNo = '1',
          String pageSize = '20',
          String sort = 'Name'}) =>
      "${_baseUrl}GetCustomerList?searchquery&pageNo=$pageNo&pageSize=$pageSize&SortyBy=$sort";
}
