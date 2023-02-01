import 'bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'main.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List favourites = [];
  BottomNavigationController bottomNavigationController = Get.find();
  getfav() async {
    final result = await http.post(Uri.parse("$URL/add_favouties"));
    final decoded = json.decode(result.body);
    print(decoded);
   
  }
  bool loading = false;
  String searchText = "";
  TextEditingController _controller = TextEditingController(text: "");
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) async {
            final result = await http.get(Uri.parse("$URL/add_history?url=$url"));

            setState(() {
              loading = false;
            });
            print("xxxx");
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            print(request.url);
            String searchText = request.url;
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.google.com'));

    super.initState();
  }

  void updatelist(String value) {}
  PageController control = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: AnimatedSearchBar(
          label: "Welcome To Finder!",
          controller: _controller,
          labelStyle: const TextStyle(fontSize: 20,fontFamily: "Carbon",letterSpacing: 2),
          searchStyle: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          searchDecoration: const InputDecoration(
            hintText: "Search",
            alignLabelWithHint: true,
            fillColor: Colors.white,
            focusColor: Colors.white,
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            print("value on Change");
            setState(() {
              searchText = value;
            });
          },
          closeIcon: !loading
              ? IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    print(searchText);
                    setState(() {
                      controller.loadRequest(Uri.parse('https://$searchText'));
                      setState(() {
                        loading = true;
                      });
                      print("fgh");
                    });
                  },
                )
              : const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
        ),
      ),
      body: WebViewWidget(controller: controller),
       floatingActionButton: SpeedDial(
          icon: Icons.question_mark_outlined,
          backgroundColor: Colors.red,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.home),
              label: 'Back To Home',
              backgroundColor: Colors.red,
              onTap: () {
                controller.loadRequest(Uri.parse('https://www.google.com'));
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.favorite),
              label: 'Add To Favourites',
              backgroundColor: Colors.red,
              onTap: () async{
                final url = await controller.currentUrl();
                print(url);
                final result = await http.get(Uri.parse("$URL/add_favouties?url=$url"));
              },
            ),
          ]),
    );
  }
}
