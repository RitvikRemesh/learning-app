import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learning/carouselslider/carourselslider1.dart';
import 'package:learning/carouselslider/carouselslider2.dart';
import 'package:learning/carouselslider/carouselslider3.dart';
import 'package:learning/myclasses.dart';
import 'package:learning/sliderstyle2.dart';

class Bookclasses extends StatefulWidget {
  const Bookclasses({super.key});

  @override
  State<Bookclasses> createState() => _ClassesState();
}

class _ClassesState extends State<Bookclasses> {
   String selectedClass = "Arts & Humanities";
  String selectedType = "Group Study";
   List<String> classTypes = ["Group Study", "Private Study"];
   List<Map<String,String>> categories =[
    {"title": "Arts & Humanities",},
    {"title": "Computers & Tech"},
    {"title": "Law & Politics"},
    
  ];
  bool isChecked = false;

  Widget getselectedWidget(){
    switch(selectedClass){
      case 'Arts & Humanities': return  const Carourselslider1();
      case 'Computers & Tech': return const Carouselslider2();
      case 'Law & Politics': return const Carouselslider3() ;    
//     case 'Hardware & OS': return Carousel4();
//     case 'Literatures': return Carousel5();
    default : return const Bookclasses();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BOOK YOUR CLASS",style: TextStyle(color: Color.fromARGB(255, 92, 42, 179)),),
       
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
      body:  ListView(
        children:[ Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[ CarouselSlider(
              options: CarouselOptions(
                height: 200,
                 enlargeCenterPage: true,
                viewportFraction: 0.7,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: const  [
                Sliderstyle2(
                  imagePath: "assets/image4.jpg",
                  category: "Arts & Humanities",
                  title: "12 courses",
                ),
                Sliderstyle2(
                  imagePath: "assets/image5.jpg",
                  category: "Computer & Tech",
                  title: "Programming Basics",
                ),
                // Sliderstyle2(
                //   imagePath: "assets/image6.jpg",
                //   category: "Photography",
                //   title: "Digital Photography",
                // ),
              ],
            ),
           const SizedBox(height: 20,),
             Row(
               
                children: [
                 const Padding(
                    padding: EdgeInsets.only(left: 10
                    )
                    ),
                  Column(
                    children: [
                      const Padding(
                        padding:  EdgeInsets.only(right: 60),
                        child: Text("Select Class", style: TextStyle(color: Color.fromARGB(255, 92, 42, 179),fontWeight: FontWeight.bold,fontSize: 20)),
                      ),
                      Container(
                        padding:const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 92, 42, 179),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton<String>(
                          value: selectedClass,
                          dropdownColor: const Color.fromARGB(255, 92, 42, 179),
                           iconEnabledColor: Colors.white,
                          underline: const SizedBox(),
                          onChanged: (value) => setState(() => selectedClass = value!),
                          items: categories.map((category) {
                            return DropdownMenuItem<String>(
                              value: category["title"],
                              
                              child: Text(category["title"]!,style: const TextStyle(color: Colors.white),),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                 const SizedBox(width: 20,),
                  Column(
                    children: [
        
                     const Padding(
                        padding:  EdgeInsets.only(right: 30),
                        child: Text("Class Type", style: TextStyle(
                          color: Color.fromARGB(255, 92, 42, 179),
                          fontWeight: FontWeight.bold,fontSize: 20
                          ),
                          ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 92, 42, 179),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton<String>(
                          dropdownColor: const Color.fromARGB(255, 92, 42, 179),
                          iconEnabledColor: Colors.white,
                          value: selectedType,
                          underline: const SizedBox(),
                          onChanged: (value) => setState(() => selectedType = value!),
                          items: classTypes.map((type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type,style: const TextStyle(color: Colors.white),),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                 ],
               ),
             const SizedBox(height: 40),
               Padding(
                 padding: const EdgeInsets.only(right: 100),
                 child: Text(selectedClass,
                 style: const TextStyle(color: Color.fromARGB(255, 92, 42, 179),fontSize:20),
                 ),
               ),
               
             Container(
              height: 200,
              width: 1800,
              color: const Color.fromARGB(255, 211, 236, 248),
              child: getselectedWidget(),
              
             ),

              // CarouselSlider(
              //  options: CarouselOptions(
              //   height: 200,
              //   //enlargeCenterPage: true,
              //   viewportFraction: 0.5,
              //   autoPlay: true,
              //   autoPlayInterval: const Duration(seconds: 3),
              //   autoPlayAnimationDuration:const Duration(milliseconds: 800),
              //   autoPlayCurve: Curves.fastOutSlowIn,
              //    ),
              //             items:   [
              //   InkWell(
              //     onTap: (){
                    
              //     },
              //     child: const Sliderstyle3(
              //       imagePath: "assets/image7.jpeg",
              //       category: "Arts & Humanities",
              //       title: "12 courses",
              //     ),
              //   ),
              //   InkWell(
              //     onTap: () {
                    
              //     },
              //     child: const Sliderstyle3(
              //       imagePath: "assets/image8.webp",
              //       category: "Computer & Tech",
              //       title: "Programming Basics",
              //     ),
              //   ),
              //   InkWell(
              //     onTap: (){
        
              //     },
              //     child: const Sliderstyle3(
              //       imagePath: "assets/image9.jpg",
              //       category: "Photography",
              //       title: "Digital Photography",
              //     ),
              //   ),
              //              ],
              //            ),   
             const SizedBox(height: 30),
             Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) => setState(() => isChecked = value!),
                    ),
                      const  Expanded(
                         child: Text("Are you sure with selected class?", 
                                             style: TextStyle(fontSize: 20,color:Color.fromARGB(255, 92, 42, 179) )),
                       ),
                    
                  ],
                ),
            ),
              const SizedBox(height: 10),
               Padding(
                padding: EdgeInsets.only(left: 100),
                 child: ElevatedButton(
                    onPressed: isChecked ? () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Myclasses()));
                    } : null,
                      style: ElevatedButton.styleFrom(
                      backgroundColor:const Color.fromARGB(255, 92, 42, 179),
                      disabledBackgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15) ),
                      
                    ),
                    child:const  Expanded(child: Text("Book Class Now", style: TextStyle(fontSize: 20, color: Colors.white))),
                    
                  ),
               ),
              
            ],
            
          ),
        ]
      ),
       
    );
  }
}