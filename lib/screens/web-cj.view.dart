import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:cj_app/helpers/common_func.dart';

class CJWebView extends StatefulWidget {
  final String path;
  final String title;
  const CJWebView({Key? key, required this.path, required this.title}) : super(key: key);

  @override
  State<CJWebView> createState() => _CJWebViewState();
}

class _CJWebViewState extends State<CJWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(getWebView(widget.path))),
            onReceivedServerTrustAuthRequest: (controller, challenge) async {
              //Do some checks here to decide if CANCELS or PROCEEDS
              return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
            },
            onWebViewCreated: (InAppWebViewController controller) {}));
  }
}
