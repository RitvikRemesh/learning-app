import 'dart:io';
import 'package:flutter/material.dart';
import 'package:learning/login.dart';


class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 236, 248),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 211, 236, 248),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color.fromARGB(255, 92, 42, 179),),
          onPressed: () =>exit(0),
          tooltip: 'closeapp',
        ),
      ),
      
        body:ListView(
          children:[ Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // IconButton(onPressed: (){SystemNavigator.pop();}, icon: const  Icon(Icons.arrow_back_ios_outlined)),
                  Image.asset(
                    'assets/image1.webp', 
                     height: 500,
                     width: 500,
                  ),
                 const  SizedBox(height: 50),
                 const  Text(
                    "Online learning platform",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 92, 42, 179),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Education is the kindling of a flame, not the filling of a vessel",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginPage()));
                    },
                    style: ElevatedButton.styleFrom(
                       backgroundColor: Color.fromARGB(255, 92, 42, 179), 
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15), 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child:const  Text(
                      "Start Learning",
                      style: TextStyle(fontSize: 16,color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
                ),
          ]
        ),
        
    );
  }
}

