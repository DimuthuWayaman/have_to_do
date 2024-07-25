import 'package:flutter/material.dart';
import 'package:myapp/components/splash_screen.dart';

import 'package:hive_flutter/hive_flutter.dart';



void main() async {

  //initialize the hives(memory)
 await Hive.initFlutter();

 //open a box
var box = await Hive.openBox('mybox');



  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      
      
      
    );
  }
}

