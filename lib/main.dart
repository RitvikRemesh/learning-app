import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learning/classes.dart';
import 'package:learning/home.dart';
import 'package:learning/login.dart';
import 'package:learning/provider.dart';
import 'package:learning/register.dart';
import 'package:learning/scrn1.dart';
import 'package:learning/scrn2.dart';
import 'package:learning/splashscrn.dart';
import 'package:provider/provider.dart';

void main(List<String> args)  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBE5zSA8Jzj0V-vfLYKbygm1_gj5Kf-dRg',
      appId: '1:730567865597:web:973801e875074e11ce3a94',
      messagingSenderId: '730567865597',
      projectId: 'ritvik-608cd',
      authDomain: 'ritvik-608cd.firebaseapp.com',
      storageBucket: 'ritvik-608cd.firebasestorage.app',
      measurementId: 'G-9E75CR1WVK',
    ),
  );
 runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) =>UserProvider() ,)
    ],
     child:   MaterialApp(
       debugShowCheckedModeBanner: false,
       initialRoute: "/classes",
       routes: {
        // '/splash':(context)=>SplashScreen(),
        // '/scrn1':(context)=>Screen1(),
        // '/login':(context)=>LoginPage(),
        // '/register':(context)=>RegisterPage(),
        // '/scrn2':(context)=>Scrn2(),
        // '/classes':(context)=>Bookclasses(),
        
        
       },
      home:Home()
     )
    );
  }
}
