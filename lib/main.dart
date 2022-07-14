import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme:AppBarTheme(
          backgroundColor: Color(0xff032b21),
        ),
        scaffoldBackgroundColor: Color(0xff032b21),
        // textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))
      ),
      home: InputPage(),
    );
  }
}