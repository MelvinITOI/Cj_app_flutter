import 'package:cj_app/services/api_client.dart';
import 'package:cj_app/services/data_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:cj_app/screens/layout.dart';

const users = {
  'user@gmail.com': '12345',
};

class LoginScreen extends StatelessWidget {
  final FileStore store = FileStore();
  LoginScreen({Key? key}) : super(key: key);

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');

    return loginUser(data.name, data.password).then((resp) {
      if (resp != null) {
        if (resp.containsKey("error")) {
          return resp["error"];
        }

        store.add('token', resp["token"], isSecure: true);
        store.add('username', resp["username"]);
        store.add('user', resp["user"]);
        return null;
      } else {
        return 'Unable to login! Please try again later.';
      }
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return '';
    });
  }

  final inputBorder = const BorderRadius.vertical(
    bottom: Radius.circular(10.0),
    top: Radius.circular(20.0),
  );

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      logo: const AssetImage('assets/images/CJ_Login.png'),
      hideForgotPasswordButton: true,
      theme: LoginTheme(buttonTheme: const LoginButtonTheme(backgroundColor: Colors.green), arcColorList: [
        const Color(0xFF2b3b4f),
        const Color(0xFF0d1b2a),
      ]),
      onLogin: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const Layout(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      savedEmail: '',
      savedPassword: '',
    );
  }
}
