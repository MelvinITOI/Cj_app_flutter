import 'package:flutter/material.dart';

const appUrl = 'https://careerjourney.org';
const apiUrl = 'https://careerjourney.org';
const appTitle = 'CareerJourney';
const apiPort = 8443;

// APIs
const apiLoginUrl = '$apiUrl:$apiPort/cj/nonsecure/cj/token';
const apiPwdResetUrl = '$apiUrl:$apiPort/cj/nonsecure/verifyEmailForUnique/';

// App Navigation
const bottomNavItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.people),
    label: 'Connections',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.event),
    label: 'Sessions',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.checklist),
    label: 'Plans',
  ),
];

// Meeting Details
const meetingUrl = 'https://cj-conf.eastus.cloudapp.azure.com/';
const meetingUserName = "#userInfo.displayName=";
const meetingUserEmail = "&userInfo.email=";
const meetingParams = "&config.prejoinPageEnabled=false&config.requireDisplayName=false&config.disableDeepLinking=true";
