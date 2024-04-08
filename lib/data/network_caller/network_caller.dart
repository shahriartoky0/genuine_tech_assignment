import 'dart:convert';

import 'package:genuine_tech_assignment/controller/auth_controller.dart';
import 'package:genuine_tech_assignment/data/network_caller/network_response.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<NetworkResponse> postRequest(String url,
      {Map<String, dynamic>? body, bool isLogin = false}) async {
    try {
      final Response response = await post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'content-type': 'Application/json',
        },
      );
      if (response.statusCode == 200) {
        return NetworkResponse(
            isSuccess: true,
            jsonResponse: jsonDecode(response.body),
            statusCode: 200);
      }
      // else if (response.statusCode == 401) {
      //   if (isLogin == false) {
      //     backToLogin();
      //   }
      //   return NetworkResponse(
      //       isSuccess: false,
      //       statusCode: response.statusCode,
      //       jsonResponse: jsonDecode(response.body));
      // }
      else {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            jsonResponse: jsonDecode(response.body));
      }
    } catch (e) {
      return NetworkResponse(isSuccess: false, errorMessage: e.toString());
    }
  }

  Future<NetworkResponse> getRequest(String url,
      {Map<String, dynamic>? body, bool isLogin = false}) async {
    try {
      final Response response = await get(
        Uri.parse(url),
        headers: {
          'content-type': 'Application/json',
          'Authorization': AuthController.token.toString(),
        },
      );
      if (response.statusCode == 200) {
        return NetworkResponse(
            isSuccess: true,
            jsonResponse: jsonDecode(response.body),
            statusCode: 200);
      }
      // else if (response.statusCode == 401) {
      //   if (isLogin == false) {
      //     backToLogin();
      //   }
      //   return NetworkResponse(
      //       isSuccess: false,
      //       statusCode: response.statusCode,
      //       jsonResponse: jsonDecode(response.body));
      // }
      else {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            jsonResponse: jsonDecode(response.body));
      }
    } catch (e) {
      return NetworkResponse(isSuccess: false, errorMessage: e.toString());
    }
  }
}
