import 'dart:async';
import 'dart:convert';
import 'package:cj_app/helpers/app.constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const jsonHeader = {"Content-Type": "application/json"};
const JsonEncoder encoder = JsonEncoder.withIndent('  ');

Future<dynamic> loginUser(username, passwd) async {
  try {
    final loginData = {
      'username': username,
      'password': passwd,
    };

    final body = encoder.convert(loginData);

    final response = await http.post(Uri.parse(apiLoginUrl),
        headers: jsonHeader, body: body);

    if (response.statusCode == 200) {
      dynamic respJSON = jsonDecode(response.body) as Map<String, dynamic>;
      return respJSON;
    } else {
      debugPrint('Response code: ${response.statusCode}');
      return null;
    }
  } catch (ex) {
    //debugPrint('Unable to login! Error: ex');
    return null;
  }
}

// Future<User> fetchUser() async {
//   final response = await http.get(Uri.parse(apiLoginUrl));

//   if (response.statusCode == 200) {
//     return User.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to get User data');
//   }
// }
