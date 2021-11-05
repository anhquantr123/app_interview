import 'package:app_interview/screen/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:app_interview/constants/constants_style.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

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
      home: const SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
