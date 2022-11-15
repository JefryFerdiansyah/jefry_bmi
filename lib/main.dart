import 'package:flutter/material.dart';
import 'package:tugas1_bmi/constants/constant.dart';
import 'package:tugas1_bmi/views/bmi_data_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: primaryColor,
          ),
          titleTextStyle: TextStyle(
            color: primaryColor,
          ),
          backgroundColor: Colors.white,
        )
      ),
      home: const BmiDataScreen()
    );
  }
}

