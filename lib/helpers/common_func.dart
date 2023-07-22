import 'dart:developer';

import 'package:cj_app/helpers/app.constants.dart';
import 'package:cj_app/services/data_store.dart';
import 'package:cj_app/models/user.dart';

final FileStore store = FileStore();

logoutUser() {
  try {
    store.clear();

    return true;
  } catch (ex) {
    log('Unable to clear datastore! Error: $ex');
    return false;
  }
}

getUser() {
  return User.fromJson(store.get('user'));
}

getWebView(String path) {
  User _user = getUser();
  String _token = store.get('token', isSecure: true);
  String userDetails = "id=${_user.id}&emailId=${_user.emailId}&name=${_user.firstName} ${_user.lastName}";
  return "$appUrl/m?$userDetails&token=$_token&navigate=$path";
}
