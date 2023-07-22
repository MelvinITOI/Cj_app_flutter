import 'package:flutter/material.dart';

import 'package:cj_app/widgets/dialogs.dart';
import 'package:cj_app/helpers/app.constants.dart';

import 'package:cj_app/helpers/common_func.dart';
import 'package:cj_app/models/user.dart';

import 'package:cj_app/screens/login.dart';
import 'package:cj_app/screens/web-home.view.dart';
import 'package:cj_app/screens/web-connection.view.dart';
import 'package:cj_app/screens/web-session.view.dart';
import 'package:cj_app/screens/web-plans.view.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  // final FileStore store = FileStore();
  int _selectedIndex = 0;
  late User _user;

  static const List<Widget> _widgetOptions = <Widget>[
    WebHomeView(),
    WebConnectionView(),
    WebSessionView(),
    WebPlansView(),
  ];

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

  String _getInitial() {
    String initial = _user.firstName[0];
    if (_user.lastName!.isNotEmpty) {
      initial += _user.lastName![0];
    }
    return initial;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _confirmLogout() {
    if (logoutUser()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  _onCancel() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', height: 50),
        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.blue.shade50,
            child: Text(_getInitial()),
          ),
          IconButton(
            icon: const Icon(Icons.logout_outlined, color: Colors.blue),
            tooltip: 'Logout',
            onPressed: () {
              showConfirmLogout(context, 'Logout', 'Are you sure you want to Logout?', _onCancel, _confirmLogout);
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
