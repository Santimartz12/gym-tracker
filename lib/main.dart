import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gim_tracker/src/screens/myApp.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarColor: Color.fromRGBO(0, 0, 0, 0),
  ));

  runApp(const MyApp());
}
