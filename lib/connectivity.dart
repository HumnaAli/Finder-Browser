import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:finder/google_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'game.dart';

class ConnectionChecker extends StatefulWidget {
  const ConnectionChecker({super.key});

  @override
  State<ConnectionChecker> createState() => _ConnectionCheckerState();
}

class _ConnectionCheckerState extends State<ConnectionChecker> {
  
  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnected = false;

  @override
  void initState(){
    super.initState();
    startStreaming();
  }

  checkInternet() async{
    result = await Connectivity().checkConnectivity();
    if (result !=ConnectivityResult.none){
      isConnected = true;
    }else{
      isConnected = false;
      showDialogBox();
    }

  setState(() {});
  }

  showDialogBox(){
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          "No Internet ⚠️",
          style:TextStyle(
            height: 1,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.red[700]
          )
          ),
        content: const Text(
          "Want to Try a Game Instead?",
          style: TextStyle(
            height: 2,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          )
          ),
        actions: [
          CupertinoButton(
            color : Colors.red,
            child: const  Text(
              "Lets Play!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
              ), 
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SnakeGame()));
            }),
        ],
      ),
    );
  }

  startStreaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) async{
      checkInternet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GoogleNavBarPage()
    );
  }
}