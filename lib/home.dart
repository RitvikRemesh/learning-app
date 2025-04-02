import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learning/classes.dart';
import 'package:learning/provider.dart';
import 'package:learning/sliderstyl.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
  
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar: AppBar(
      centerTitle: true,
        title: Text("HOME",style: TextStyle(color: Color.fromARGB(255, 92, 42, 179)),),
         backgroundColor: const Color.fromARGB(255, 211, 236, 248),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color.fromARGB(255, 92, 42, 179),),
          onPressed: () {
           Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 211, 236, 248),
      body: Column(
        children: [
          SizedBox
          (
            height: 50,
          ),
         const  Padding(
          padding:EdgeInsets.only(right: 80),
          child: Expanded(
            child: Text("Welcome Back",
            style: TextStyle(
              color: Color.fromARGB(255, 92, 42, 179),
              fontWeight: FontWeight.bold,
              fontSize: 50
              ),
             ),
          ), 
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Expanded(
                  child: Text( context.watch<UserProvider>().gmail.replaceAll("@gmail.com"," "),
                       style: const TextStyle(
                       color: Color.fromARGB(255, 92, 42, 179),
                       fontWeight: FontWeight.bold,
                       fontSize: 40,
                       ),),
                ),
              ),
            ]
          ),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Bookclasses()));
                },
                style: ElevatedButton.styleFrom(
                         backgroundColor:Color.fromARGB(255, 92, 42, 179), 
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                )
                ), 
                child: Text("Book Class",
                style: TextStyle(color: Colors.white,fontSize: 15),),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                         backgroundColor: Color.fromARGB(255, 92, 42, 179), 
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                )
                ), 
                child: Text("My Courses",
                style: TextStyle(color: Colors.white,fontSize: 15),)
                )
              ],
            ),
          ),
           SizedBox(
                  height: 40,
                ),
          Padding(
            padding: const EdgeInsets.only(right: 150),
            child: Expanded(
              child: Text("Last Classes",
              style: TextStyle(
                color: Color.fromARGB(255, 92, 42, 179),
                fontSize:40 ,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
          ),
          SizedBox(height: 20,),
           CarouselSlider(
          options: CarouselOptions(
            height: 300,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
          items: const  [
            Sliderstyl(
              imagePath: "assets/image4.jpg",
              category: "Arts & Humanities",
              title: "Draw and Paint Arts",
              duration: "2h 25min",
            ),
            Sliderstyl(
              imagePath: "assets/image5.jpg",
              category: "Computer & Tech",
              title: "Programming Basics",
              duration: "7h 2min",
            ),
            Sliderstyl(
              imagePath: "assets/image6.jpg",
              category: "Photography",
              title: "Digital Photography",
              duration: "4h 15min",
            ),
          ],
        ),
      
        ]
      ),
    );
  }
}

