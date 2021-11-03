import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:app_interview/constants/constants_style.dart';
import 'package:app_interview/screen/home/home_screen.dart';

Future fetchUser() async {
  final response = await http
      .get(Uri.parse('https://6182730384c2020017d89e80.mockapi.io/api/user'));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load album');
  }
}

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
