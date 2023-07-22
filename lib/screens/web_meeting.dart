import 'dart:io';
import 'package:cj_app/helpers/app.constants.dart';
import 'package:cj_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:cj_app/helpers/common_func.dart';

class MeetingWebView extends StatefulWidget {
  final String meetingID;
  const MeetingWebView({Key? key, required this.meetingID}) : super(key: key);

  @override
  State<MeetingWebView> createState() => _MeetingWebViewState();
}

class _MeetingWebViewState extends State<MeetingWebView> {
  InAppWebViewController? _webViewController;
  User? _user;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  _getUser() {
    User user = getUser();
    setState(() {
      _user = user;
    });
  }

  String _getMeetingUrl() {
    String meetingUri =
        "$meetingUrl${widget.meetingID}$meetingUserName\"${_user?.firstName}\"$meetingUserEmail\"${_user?.emailId}\"$meetingParams";
    print(meetingUri);
    return meetingUri;
  }

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //     child: InAppWebView(
    //         //userInfo.displayName="rajesh"&userInfo.email="rajesh@gmail.com"&config.prejoinPageEnabled=false&config.requireDisplayName=false
    //         initialUrlRequest: URLRequest(url: Uri.parse(_getMeetingUrl())),
    //         initialOptions: InAppWebViewGroupOptions(
    //           crossPlatform: InAppWebViewOptions(
    //             mediaPlaybackRequiresUserGesture: false,
    //           ),
    //         ),
    //         onWebViewCreated: (InAppWebViewController controller) {
    //           _webViewController = controller;
    //         },
    //         androidOnPermissionRequest: (InAppWebViewController controller,
    //             String origin, List<String> resources) async {
    //           return PermissionRequestResponse(
    //               resources: resources,
    //               action: PermissionRequestResponseAction.GRANT);
    //         }));

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: InAppWebView(
                  //userInfo.displayName="rajesh"&userInfo.email="rajesh@gmail.com"&config.prejoinPageEnabled=false&config.requireDisplayName=false
                  initialUrlRequest:
                      URLRequest(url: Uri.parse(_getMeetingUrl())),
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                      mediaPlaybackRequiresUserGesture: false,
                    ),
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    _webViewController = controller;
                  },
                  androidOnPermissionRequest:
                      (InAppWebViewController controller, String origin,
                          List<String> resources) async {
                    return PermissionRequestResponse(
                        resources: resources,
                        action: PermissionRequestResponseAction.GRANT);
                  }))),
    );
  }
}
