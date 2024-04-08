import 'package:get/get.dart';

import '../data/models/user_details_model.dart';
import '../data/network_caller/network_caller.dart';
import '../data/utilities/urls.dart';
import 'auth_controller.dart';

class LoginController extends GetxController {
  bool get logInProgress => _logInProgress;

  String get message => _message;
  bool _logInProgress = false;

  String _message = '';

  Future<bool> signIn({required email, required password}) async {
    _logInProgress = true;
    update();

    final response =
        await NetworkCaller().getRequest(URL.loginUrl(email, password));

    _logInProgress = false;
    update();

    if (response.isSuccess) {
      final dynamic token = response.jsonResponse?['Token'];
      final dynamic userDetailsJson = response.jsonResponse;
      if (token != null && userDetailsJson != null) {
        final userDetails = UserDetails.fromJson(userDetailsJson);
        await Get.find<AuthController>()
            .saveUserInformation(token, userDetails);

        _message = 'Login Successful';
      }
      return true;
    } else {
      if (response.statusCode == 401) {
        _message = 'Incorrect Username or Password';
      } else {
        _message = 'An Error Occurred';
      }
      return false;
    }
  }
}
