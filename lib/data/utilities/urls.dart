class URL {
  static const String _baseUrl =
      "https://www.pqstec.com/InvoiceApps/Values/LogIn";

  static String loginUrl(String email, String password) =>
      // '$_baseUrl/updateTaskStatus/$taskId/$status';
      '$_baseUrl?UserName=$email&Password=$password&ComId=1';

  static const String imageUrl = "https://www.pqstec.com/InvoiceApps/";
}
