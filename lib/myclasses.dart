import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:learning/provider.dart';

class Myclasses extends StatefulWidget {
  const Myclasses({super.key});

  @override
  State<Myclasses> createState() => _MyclassesState();
}

class _MyclassesState extends State<Myclasses> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<UserProvider>().fetchClasses();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> classes = context.watch<UserProvider>().items;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "MY CLASSES",
          style: TextStyle(color: Color.fromARGB(255, 92, 42, 179)),
        ),
        backgroundColor: const Color.fromARGB(255, 211, 236, 248),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color.fromARGB(255, 92, 42, 179)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 211, 236, 248),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: classes.isEmpty
            ? const Center(child: Text("No classes added yet!"))
            : ListView.builder(
                itemCount: classes.length,
                itemBuilder: (context, index) {
                  return _buildCourseCard(classes[index]);
                },
              ),
      ),
    );
  }

  Widget _buildCourseCard(String courseTitle) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              courseTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromARGB(255, 92, 42, 179),
              ),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.5, // Placeholder progress
              backgroundColor: Colors.grey[300],
              color: const Color.fromARGB(255, 92, 42, 179),
            ),
          ],
        ),
      ),
    );
  }
}
