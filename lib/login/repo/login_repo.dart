import 'dart:convert';
import 'package:bloc_demo/login/model/login_req_model.dart';
import 'package:bloc_demo/login/model/login_resp_model.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  Future<LoginRespModel> login(String userName, String password) async {
    // URL
    var url = "https://dummyjson.com/auth/login";

    // Header
    Map<String, String> headers = {'Content-Type': 'application/json'};

    // Request Model
    LoginReqModel loginReqModel =
        LoginReqModel(username: userName, password: password);

    // Post Method
    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(
        loginReqModel.toJson(),
      ),
    );

    try {
      if (response.statusCode == 200) {
        var res = response.body;
        var resBody = jsonDecode(res);
        print("Successful ${res.toString()}");
        return LoginRespModel.fromJson(resBody);
      } else {
        var resBody = jsonDecode(response.body);
        print("Fail ${resBody['message'].toString()}");
        return resBody['message'];
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
