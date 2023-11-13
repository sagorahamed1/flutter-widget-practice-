import 'package:flutter/material.dart';
import 'package:json/afsana.dart';
import 'package:json/person_home_page.dart';
import 'package:json/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculateBmi(),
      // routes: {
      //   "/" : (context) => PersonHomePage(),
      //   "/scecondPage" : (context) => ScecondPage(),
      // },
    );
  }
}
