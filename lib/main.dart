import 'package:covidtracker/screens/loading.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //first launch the loading screen
      //the loading.dart file that will pick the live data into a json file
      theme: ThemeData.dark().copyWith(
        //create a theme for my app
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF090D22),
      ),
      home:LoadingScreen(),
    );
  }
}
