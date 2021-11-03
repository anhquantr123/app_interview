import 'package:app_interview/constants/constants_style.dart';
import 'package:app_interview/main.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
    print(futureUser.toString());
  }

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
              const Text("1. Nguyen Van Quan",
                  style: TextStyle(fontSize: textSizeBody2)),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                      child: Center(
                          child: ElipButton(
                    text: "CV",
                    press: () {
                      print("you click cv ");
                    },
                  ))),
                  Expanded(
                      child: Center(
                          child: ElipButton(
                    text: "Video",
                    press: () {
                      print("you click video ");
                    },
                  )))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ElipButton extends StatelessWidget {
  const ElipButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.elliptical(100, 50)),
              border: Border.all(
                color: colorBorder,
                width: 2,
              )),
          child: Text(text)),
    );
  }
}
