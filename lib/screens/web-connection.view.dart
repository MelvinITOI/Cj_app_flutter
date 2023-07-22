import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:cj_app/helpers/common_func.dart';

class WebConnectionView extends StatefulWidget {
  const WebConnectionView({Key? key}) : super(key: key);

  @override
  State<WebConnectionView> createState() => _WebConnectionViewState();
}

class _WebConnectionViewState extends State<WebConnectionView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragUpdate: (updateDetails) {},
        child: Scaffold(
            body: InAppWebView(
                gestureRecognizers: Set()..add(Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())),
                initialUrlRequest: URLRequest(url: Uri.parse(getWebView('connection'))),
                onReceivedServerTrustAuthRequest: (controller, challenge) async {
                  //Do some checks here to decide if CANCELS or PROCEEDS
                  return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
                },
                onWebViewCreated: (InAppWebViewController controller) {})));
  }
}
