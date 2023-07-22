import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cj_app/helpers/common_func.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebHomeView extends StatefulWidget {
  const WebHomeView({Key? key}) : super(key: key);

  @override
  State<WebHomeView> createState() => _WebHomeViewState();
}

class _WebHomeViewState extends State<WebHomeView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (updateDetails) {},
      child: Scaffold(
          body: InAppWebView(
              gestureRecognizers: Set()..add(Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())),
              initialUrlRequest: URLRequest(url: Uri.parse(getWebView('content'))),

              onReceivedServerTrustAuthRequest: (controller, challenge) async {
                //Do some checks here to decide if CANCELS or PROCEEDS
                return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
              },
              onWebViewCreated: (InAppWebViewController controller) {})),
    );
  }
}
