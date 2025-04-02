import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learning/carouselslider/sliderstyle/sliderstyle22.dart';

class Carouselslider2 extends StatefulWidget {
  const Carouselslider2({super.key});

  @override
  State<Carouselslider2> createState() => _Carouselslider2State();
}

class _Carouselslider2State extends State<Carouselslider2> {
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
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ]
                )
                    );
                    
                  },
                  child: const Sliderstyle22(
                    imagePath: "assets/image9.jpg",
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
                  content: const Text('add class to my classes'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ]
                )
                    );
                    
                  },
                  child: const Sliderstyle22(
                    imagePath: "assets/image9.jpg",
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
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ]
                )
                    );
        
                  },
                  child: const Sliderstyle22(
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