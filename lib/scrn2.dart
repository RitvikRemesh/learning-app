import 'package:flutter/material.dart';
import 'package:learning/beginner.dart';
import 'package:learning/login.dart';

class Scrn2 extends StatefulWidget {
  const Scrn2({super.key});

  @override
  State<Scrn2> createState() => _Scrn2State();
}

class _Scrn2State extends State<Scrn2> {
  String selectedLevel = "Beginner";
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 211, 236, 248),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.purple),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginPage(),));
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 211, 236, 248),
      body: ListView(
        children: [Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const  Center(
                child: Text(
                  "Learning App",
                  style: TextStyle(
                    fontSize: 30,
                    
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 92, 42, 179),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: Image.asset(
                 "assets/image2.jpg" , 
                  width: 500,
                  
                  
                ),
              ),
              const SizedBox(height: 50),
             const  Text(
                "Select your course level",
                style: TextStyle(
                  color: Color.fromARGB(255, 92, 42, 179),
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildLevelButton("Beginner"),
                  _buildLevelButton("Intermediate"),
                  _buildLevelButton("Expert"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value
                    ) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    activeColor: Color.fromARGB(255, 92, 42, 179),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text("Are you sure?",style: TextStyle(color: Color.fromARGB(255, 92, 42, 179),),),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: isChecked
                      ? () {
                               Navigator.push(context,MaterialPageRoute(builder: (context) => Begin(),));
                               
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 92, 42, 179),
                    disabledBackgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        ]
      ),
    );
  }
 Widget _buildLevelButton(String level) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedLevel = level;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedLevel == level ? Color.fromARGB(255, 92, 42, 179) : Colors.white,
        side: const  BorderSide(color: Color.fromARGB(255, 92, 42, 179)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(
        level,
        style: TextStyle(
          color: selectedLevel == level ? Colors.white : Color.fromARGB(255, 92, 42, 179),
        ),
     ),
     );
     }
}
  