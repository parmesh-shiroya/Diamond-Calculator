import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

const kBackgroudColor = Color(0xFF282B2F);
const kPrimaryColor = Color(0xFF4B4E61);
const kPrimaryDarkColor2 = Color(0xFF1D1F23);
const kPrimaryDarkColor = Color(0xFF0C0E10);
const kPrimaryDarkColor3 = Color(0xFF25272D);
const kAdmobID = "ca-app-pub-4181876387693872~5806913849";

const kAccentColor = Color(0xFF5E7AF4);

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['diamond', 'gold', "jewelry"],
  childDirected: false,
  testDevices: <String>[
    "b2a5500d7a338af6"
  ], // Android emulators are considered test devices
);
