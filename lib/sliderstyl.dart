import 'package:flutter/material.dart';

class Sliderstyl extends StatelessWidget {
  final String imagePath;
  final String category;
  final String title;
  final String duration;

  const Sliderstyl({super.key, required this.imagePath, required this.category, required this.title, required this.duration});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
         width:400 ,
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
              child: Image.asset(imagePath, height: 160, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category, style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 92, 42, 179))),
                  SizedBox(height: 10),
                  Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 92, 42, 179))),
                  SizedBox(height: 10),
                  Text(duration, style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 92, 42, 179))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}