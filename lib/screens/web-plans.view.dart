import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:cj_app/helpers/common_func.dart';

class WebPlansView extends StatefulWidget {
  const WebPlansView({Key? key}) : super(key: key);

  @override
  State<WebPlansView> createState() => _WebPlansViewState();
}

class _WebPlansViewState extends State<WebPlansView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragUpdate: (updateDetails) {},
        child: Scaffold(
            body: InAppWebView(
                gestureRecognizers: Set()..add(Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())),
                initialUrlRequest: URLRequest(url: Uri.parse(getWebView('plans'))),
                onReceivedServerTrustAuthRequest: (controller, challenge) async {
                  //Do some checks here to decide if CANCELS or PROCEEDS
                  return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
                },
                onWebViewCreated: (InAppWebViewController controller) {})));
  }
}
