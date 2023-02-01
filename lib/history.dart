import 'package:finder/main.dart';

import 'bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List history = [];
  BottomNavigationController bottomNavigationController = Get.find();
  gethist() async {
    final result = await http.get(Uri.parse(URL));
    final decoded = json.decode(result.body);
    print(decoded);
    setState(() {
      history  = decoded["history"];
    });
  }
  @override
  void initState() {
    gethist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // gethist()
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'History',
            style: TextStyle(
              fontFamily: "Carbon",
              fontWeight: FontWeight.bold,
              fontSize: 30,
              letterSpacing: 2,
            ),
            ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.red,
        ),
        body: history.isNotEmpty
            ? ListView.builder(itemBuilder: itemBuilder,itemCount: history.length,)
            : const Center(
              child: Text(
                "No History yet 🌎",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                )
              ),
            backgroundColor: Colors.grey[850],
            floatingActionButton: FloatingActionButton(
              child:Icon(Icons.refresh),
              backgroundColor: Colors.red,
              onPressed: (){
                gethist();
                ListView.builder(itemBuilder: itemBuilder,itemCount: history.length,);
              }
            ),
            );
  }
  Widget itemBuilder(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(
          history[index],
          style: const TextStyle(
            height : 3,
            fontSize: 13,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
      ),
    );
  }
}
