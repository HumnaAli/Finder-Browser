import 'package:finder/main.dart';
import 'bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FavPage extends StatefulWidget {

  FavPage({Key? key}) : super (key:key);

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  List favourites = [];
  BottomNavigationController bottomNavigationController = Get.find();
  getfav() async {
    final result = await http.get(Uri.parse("$URL/get_favouties"));
    final decoded = json.decode(result.body);
    print(decoded);
    setState(() {
      favourites  = decoded["favourites"];
    });
  }

  @override
  void initState() {
    getfav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:AppBar(
          title: const Text(
            'Favourites',
            style: TextStyle(
              fontFamily: "Carbon",
              fontWeight: FontWeight.bold,
              fontSize: 30,
              letterSpacing: 2,
            ),
            ),
          centerTitle : true,
          elevation: 0,
          backgroundColor: Colors.red,
      ),
     body: favourites.isNotEmpty
            ? ListView.builder(itemBuilder: itemBuilder,itemCount: favourites.length,)
            : const Center(
              child: Text(
                "No Favourites yet! 🚩",
                style: TextStyle(
                  height : 1.7,
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
              onPressed: () {
                getfav();
                ListView.builder(itemBuilder: itemBuilder,itemCount: favourites.length,);
              } 
              ),
            );
  }
  Widget itemBuilder(BuildContext context, int index) {
    // print(history[index]["url"]);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(
          favourites[index],
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