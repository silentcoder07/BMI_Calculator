import 'package:flutter/material.dart';
import 'inputpage.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:Color(0xFF0A0F33),
        primaryColor: Color(0xFF0A0F33)
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 20,
          title: Text('BMI Calculator'),
        ),
        body: InputPage(),
      ),
    );
  }
}