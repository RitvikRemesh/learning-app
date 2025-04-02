import 'package:flutter/material.dart';

class Myclasses extends StatefulWidget {
  const Myclasses({super.key});

  @override
  State<Myclasses> createState() => _MyclassesState();
}

class _MyclassesState extends State<Myclasses> {

final List<Course> courses = [
    Course(
      title: "Arts & Humanities",
      subtitle: "Draw and paint Arts",
      progress: 0.8,
      image: "assets/image8.webp", 
    ),
    Course(
      title: "Arts & Humanities",
      subtitle: "Business & Law",
      progress: 0.1,
      image: "assets/image9.jpg", 
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
         title: 
           Text("MY CLASSES",style: TextStyle(color: Color.fromARGB(255, 92, 42, 179)),
        ),
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
        body:Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return CourseCard(course: courses[index]);
          },
        ),
      ),
    );
  }
}

class Course {
  final String title;
  final String subtitle;
  final double progress;
  final String image;

  Course({required this.title, required this.subtitle, required this.progress, required this.image});
}

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                course.image,
                width: 120, 
                height: 120, 
                fit: BoxFit.cover, 
              ),
            ),
            const SizedBox(width: 16), 
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 92, 42, 179),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    course.subtitle,
                    style: const TextStyle(color: Color.fromARGB(255, 92, 42, 179)),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: course.progress,
                    backgroundColor: Colors.grey[300],
                    color: const Color.fromARGB(255, 92, 42, 179),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

      
  }
}



