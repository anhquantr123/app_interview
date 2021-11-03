import 'package:app_interview/constants/constants_style.dart';
import 'package:app_interview/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: colorBackground,
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
