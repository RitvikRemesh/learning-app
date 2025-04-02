import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learning/carouselslider/sliderstyle/sliderstyle11.dart';
import 'package:learning/provider.dart';
import 'package:provider/provider.dart';

class Carourselslider1 extends StatefulWidget {
  const Carourselslider1({super.key});

  @override
  State<Carourselslider1> createState() => _Carourselslider1State();
}

class _Carourselslider1State extends State<Carourselslider1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
               options: CarouselOptions(
                height: 200,
                //enlargeCenterPage: true,
                viewportFraction: 0.5,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration:const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                 ),
                          items:   [
                InkWell(
                  onTap: (){
                    showDialog(
                      context: context,
            builder:
                (BuildContext context) => AlertDialog(
                  title: const Text('ADD CLASS'),
                  content: const Text('add class to my classes'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<UserProvider>().addItem("CHESS");

                        Navigator.pop(context, 'OK');
                        },
                      child: const Text('OK'),
                    ),
                  ]
                )
                    );
                  },
                  child: const Sliderstyle11(
                    imagePath: "assets/image7.jpeg",
                    category: "Arts & Humanities",
                    title: "12 courses",
                  ),
                ),
                InkWell(
                  onTap: () {
                     showDialog(
                      context: context,
            builder:
                (BuildContext context) => AlertDialog(
                  title: const Text('ADD CLASS'),
                  content: const Text("add class to my classes"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<UserProvider>().addItem("CHESS");

                        Navigator.pop(context, 'OK');
                        },
                      child: const Text('OK'),
                    ),
                  ]
                )
                    );
                    
                  },
                  child: const Sliderstyle11(
                    imagePath: "assets/image8.webp",
                    category: "Computer & Tech",
                    title: "Programming Basics",
                  ),
                ),
                InkWell(
                  onTap: (){
                     showDialog(
                      context: context,
            builder:
                (BuildContext context) => AlertDialog(
                  title: const Text('ADD CLASS'),
                  content: const Text('add class to my classes'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<UserProvider>().addItem("CHESS");

                        Navigator.pop(context, 'OK');
                        },
                      child: const Text('OK'),
                    ),
                  ]
                )
                    );
        
                  },
                  child: const Sliderstyle11(
                    imagePath: "assets/image9.jpg",
                    category: "Photography",
                    title: "Digital Photography",
                  ),
                ),
                           ],
                         ),
    );
  }
}