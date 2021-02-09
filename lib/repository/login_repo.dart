import 'dart:convert';
import 'dart:io';

import 'package:dhanda/helper/api_urls.dart';
import 'package:dhanda/helper/shared_prefs.dart';
import 'package:dhanda/model/business_model.dart';
import 'package:dhanda/model/review_tag_model.dart';
import 'package:dhanda/model/login_model.dart';
import 'package:dio/dio.dart';

class LoginRepo {

  Future<LoginModel> loginUser(params) async {
    var dio = Dio();
    Response response = await dio.post(
        ApiUrls.login,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: UserPreferences().getBearerToken(),
      }),
      queryParameters: params
    );
    LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.toString()));
    print('API RESPONSE LOGIN : ${response.toString()}');
    return loginModel;
  }

}
