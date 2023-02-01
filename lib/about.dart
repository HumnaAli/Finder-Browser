import 'bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  BottomNavigationController bottomNavigationController = Get.find();
  AboutPage({Key? key}) : super (key:key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: const Text(
            'About',
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
      body : Column(
          children: <Widget> [
            Center(
              child: Container(
                height: 770.7,
                width:  MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 46, 46, 46),
                      Color.fromARGB(255, 46, 46, 46),
                      // Colors.lightBlue,
                      // Colors.pink,
                      Colors.black,
                    ],
                  )
                ),
                // color: Colors.grey[850],
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget> [
                      Text(
                        "Welcome to!",
                        style: TextStyle(
                          fontFamily: "Carbon",
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Finder",
                        style: TextStyle(
                          fontFamily: "Carbon",
                          fontSize: 150,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        """Finder is a browser programme that offers all the features  of an excellent, effective Browser.   
                          Finder offers everything, from quick searching and results  retrieval to little storage usage. Options for search and    download history are also offered. 
                          Additionally, finder includes a fun game that the user may  access while offline for a more engaged user experience.""",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                        ),
                        SizedBox(
                        height: 50,
                      ),
                      Text(
                        "A Project by a Group of Three from The Department of Computer Science at Institite of Space Technology,Islamabad.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color : Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          

                        ),
                      ),
                    ],
                  ),
                ),
       ),
            ),
          ],
        ),
    );
  }
}