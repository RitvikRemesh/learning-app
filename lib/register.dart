// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning/provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
 
  const RegisterPage({super.key});

  @override 
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController gmailController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

  final _registerkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 150),
          child: Text(
            "",
            style: TextStyle(
              color: Color.fromARGB(255, 92, 42, 179),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 211, 236, 248),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromARGB(255, 92, 42, 179),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
     backgroundColor: const Color.fromARGB(255, 211, 236, 248),
      body: ListView(
        key: _registerkey,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Create An Account',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 92, 42, 179),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 70),
                const Text(
                  'Enter your details',
                  style: TextStyle(
                    fontSize: 35,
                    color: Color.fromARGB(255, 92, 42, 179),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                Form(
                  key: _registerkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          controller: namecontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Name',
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 92, 42, 179),
                                    width: 2),
                                borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 92, 42, 179),
                                    width: 2)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          controller: gmailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter an email id";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 92, 42, 179),
                                    width: 2),
                                borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 92, 42, 179),
                                    width: 2)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          obscureText: true,
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter the password";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 92, 42, 179),
                                  width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 92, 42, 179),
                                  width: 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: ElevatedButton(
                    onPressed: () async {
                     
                      if (_registerkey.currentState!.validate()) {
                        try {
                          UserCredential userData = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: gmailController.text.trim(),password: password.text.trim());
                           context.read<UserProvider>().changeUsername(newUsername: gmailController.text);

                          await FirebaseFirestore.instance.collection('users').doc(userData.user!.uid).set({
                            'uid': userData.user!.uid,
                            'email': userData.user!.email,
                            'name': namecontroller.text,
                            'createdAt': DateTime.now(),
                            'status': 1
                          });

                          Navigator.pushNamedAndRemoveUntil(context, '/scrn2', (route) => false);
                        } catch (e) {
                           showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title:  Text("Enter valid details"),
                  content:  Text("$e"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color:Color.fromARGB(255, 92, 42, 179),
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay",
                        style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                 );
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(content: Text('Registration failed: Enter Valid Email ')),
                          // );
                        
                        }
                      } else {
                        showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title:  Text("Enter valid details"),
                  content:  Text("please fill the required feilds"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color:Color.fromARGB(255, 92, 42, 179),
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay",
                        style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                 );
                        
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text('Please fill Required Fields')),
                        // );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                    
                      backgroundColor: Color.fromARGB(255, 92, 42, 179),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.only(left: 110),
                  child: Row(
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.blue),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
