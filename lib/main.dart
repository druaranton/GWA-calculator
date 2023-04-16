/* 
Author: Andreau O. Aranton
Section: D-1L
Date created: 10/01/2022
Exercise number: 3
Program Description: This is a GWA calculator app created using dart/flutter
*/


import 'package:flutter/material.dart';
import 'FormPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GWA Calculator',
      theme: ThemeData( 
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Color.fromARGB(255, 239, 239, 226)
      ),
      home: GWACalcForm(),
      
    );
  }
}
class GWACalcForm extends StatefulWidget {
  const GWACalcForm({super.key});

  @override
  State<GWACalcForm> createState() => _GWACalcFormState();
}

class _GWACalcFormState extends State<GWACalcForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GWA Calculator")), body: FormPage(),
    );
  }
}