import 'package:app_interview/constants/constants_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("App Interview Demo"),
      ),
      body: Card(
        margin: const EdgeInsets.all(10),
        color: colorWhite,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("1. Nguyen Van Quan"),
              Row(
                children: const [
                  Expanded(child: Center(child: Center(child: Text("hello")))),
                  Expanded(child: Center(child: Text("hello")))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
