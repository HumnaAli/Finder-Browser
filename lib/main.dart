import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:animated_search_bar/animated_search_bar.dart';
import 'connectivity.dart';
import 'google_nav.dart';
String URL = "http://10.4.29.2:5000";
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
 const MyApp({Key? key}) : super (key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      home : ConnectionChecker(),
    );
  }
}
