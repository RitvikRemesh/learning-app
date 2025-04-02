import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learning/scrn1.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen ({super.key});

  @override
  State<SplashScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super.initState();
    Timer(const Duration(seconds: 2), ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>const Screen1())));
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft, 
            colors: [Color.fromARGB(255, 92, 42, 179),Color.fromARGB(255, 92, 13, 156)]
            ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                // Image.asset(
                //   "assets/Lexica - Bulb with brain  half the  brain smart and half creative   , fantasy, dreamlike, surrealism, super cute, trending on artstation.jpg",
                //   height: 300.0,
                //   width: 300.0,
                // ),
                 Center(
                   child: Text("Learning App",textAlign:TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      //fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                                   ),
                 ),
              ],
            ),

            //  CircularProgressIndicator( 
            //   valueColor:  AlwaysStoppedAnimation<Color>(Colors.white),
              
            // ),   
          ],
        ),
     ),
   );
  }
 }