import 'package:cj_app/services/session.service.dart';
import 'package:flutter/material.dart';
import 'web_meeting.dart';

import 'package:cj_app/models/session.model.dart';

class SessionsView extends StatefulWidget {
  const SessionsView({Key? key}) : super(key: key);
  @override
  _SessionsViewState createState() => _SessionsViewState();
}

class _SessionsViewState extends State<SessionsView> {
  // late WebViewController controller;
  List<Sessions>? sessions;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getSession();
  }

  getSession() async {
    sessions = await SessionService().getSessions();
    if (sessions != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  openMeeting(var meetingID) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MeetingWebView(meetingID: meetingID)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sessions'),
          centerTitle: true,
        ),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
              itemCount: sessions?.length,
              itemBuilder: ((context, index) {
                return Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                        title: Text(sessions![index].title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          sessions![index].desc ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.blue[500],
                        ),
                        onTap: () => openMeeting(sessions![index].title)),
                    const Divider(),
                  ],
                ));
              })),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
