import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:cj_app/helpers/app.constants.dart';
import 'package:cj_app/services/data_store.dart';
import 'package:cj_app/models/user.dart';

final FileStore store = FileStore();
User user = User.fromJson(store.get('user'));
String userDetails = jsonEncode(store.get('user'));
String _token = store.get('token', isSecure: true);

class Connections extends StatefulWidget {
  const Connections({Key? key}) : super(key: key);
  @override
  _ConnectionState createState() => _ConnectionState();
}

class _ConnectionState extends State<Connections> {
  InAppWebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connections'),
        centerTitle: true,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("$appUrl/connection")),
        onWebViewCreated: (InAppWebViewController controller) {
          _controller = controller;
        },
        onLoadStop: (_controller, url) async {
          await _controller.evaluateJavascript(source: """          
            localStorage.setItem("userDetails", "$userDetails");
            localStorage.setItem("_token", "$_token");         
          """);
        },
      ),
    );
  }
}
