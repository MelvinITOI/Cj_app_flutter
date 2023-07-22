import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:cj_app/helpers/common_func.dart';

class WebSessionView extends StatefulWidget {
  const WebSessionView({Key? key}) : super(key: key);

  @override
  State<WebSessionView> createState() => _WebSessionViewState();
}

class _WebSessionViewState extends State<WebSessionView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragUpdate: (updateDetails) {},
        child: Scaffold(
            body: InAppWebView(
                gestureRecognizers: Set()..add(Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())),
                initialUrlRequest: URLRequest(url: Uri.parse(getWebView('session'))),
                onReceivedServerTrustAuthRequest: (controller, challenge) async {
                  //Do some checks here to decide if CANCELS or PROCEEDS
                  return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
                },
                onWebViewCreated: (InAppWebViewController controller) {})));
  }
}
