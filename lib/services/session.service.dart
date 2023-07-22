import 'package:cj_app/helpers/app.constants.dart';
import 'package:cj_app/models/session.model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:cj_app/services/data_store.dart';
import 'package:cj_app/models/user.dart';

const sessionEP = {"sessions": "/secure/getSessionByUserId/{userId}"};

const epSession = '$appUrl:$apiPort/cj/secure';

final FileStore store = FileStore();
User user = User.fromJson(store.get('user'));
String token = store.get('token', isSecure: true);

class SessionService {
  Future<List<Sessions>?> getSessions() async {
    var client = http.Client();
    var userId = user.id;
    var uri = Uri.parse('$epSession/getSessionByUserId/$userId');
    var response = await client.get(uri, headers: {'Authorization': 'Bearer $token', 'X-AppName': 'Career Journey'});
    if (response.statusCode == 200) {
      return sessionsFromJson(response.body);
    } else {
      return null;
    }
  }
}
