import 'package:flutter/material.dart';

class Sliderstyle22 extends StatelessWidget {
  final String imagePath;
  final String category;
  final String title;

  const Sliderstyle22({super.key, required this.imagePath, required this.category, required this.title,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
         width:200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 50)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.asset(imagePath, height: 100, width: double.infinity, fit: BoxFit.cover),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category, style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 92, 42, 179))),
                SizedBox(height: 10),
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 92, 42, 179))),
              ],
            ),
          ],
        ),
        ),
      )
    );
  }
}