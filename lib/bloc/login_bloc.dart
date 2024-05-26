import 'dart:convert';
import 'package:belajarflutter/helpers/api.dart';
import 'package:belajarflutter/helpers/api_url.dart';
import 'package:belajarflutter/model/login.dart';

class LoginBloc {
  static Future<Login> login({String? nama, String? email, String? password}) async {
    String apiUrl = ApiUrl.login;
    var body = {"nama": nama, "email": email, "password": password};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);

    return Login.fromJson(jsonObj);
  }
}