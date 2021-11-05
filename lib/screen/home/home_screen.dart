import 'dart:convert';

import 'package:app_interview/api/config.dart';
import 'package:app_interview/constants/constants_style.dart';
import 'package:app_interview/constants/screen_default.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  }

  var array = [];

  Future fetchUser() async {
    final response = await http
        .get(Uri.parse('https://6182730384c2020017d89e80.mockapi.io/api/user'));

    if (response.statusCode == 200) {
      var _temp = jsonDecode(response.body);
      array = _temp as List;

      return response.body.toString();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("App Interview Demo"),
        ),
        body: SizedBox(
          child: FutureBuilder(
            future: futureUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: array.length,
                    itemBuilder: (context, index) => ItemListView(
                          data: array,
                          index: index,
                        ));
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}

class ItemListView extends StatelessWidget {
  const ItemListView({
    Key? key,
    required this.index,
    required this.data,
  }) : super(key: key);
  final int index;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_element
    Future putIsSeeCv(String id) async {
      var url = Uri.parse("$URL_DEFAULT/$id");
      await http.put(url, body: {"isSeeCV": "true"}).then((value) => null);
    }

    // ignore: unused_element
    Future putIsSeeVideo(String id) async {
      var url = Uri.parse("$URL_DEFAULT/$id");
      await http.put(url, body: {"isSeeVideo": "true"}).then((value) => null);
    }

    // ignore: unused_element
    Future putIsSee(String id) async {
      var url = Uri.parse("$URL_DEFAULT/$id");
      await http.put(url, body: {"isSee": "true"}).then((value) => null);
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      color: (data[index]['isSee'].toString() == "true")
          ? colorIsSee.withOpacity(0.1)
          : colorWhite,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("${(index + 1).toString()}. ",
                    style: const TextStyle(
                        fontWeight: fontBold, fontSize: textSizeBody2)),
                Text(data[index]['name_user'].toString(),
                    style: const TextStyle(fontSize: textSizeBody2))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                    child: Center(
                        child: ElipButton(
                  text: "CV",
                  colorBackground: (data[index]['isSeeCV'].toString() == "true")
                      ? colorIsSee
                      : colorWhite,
                  textColor: (data[index]['isSeeCV'].toString() == "true")
                      ? textColorWhite
                      : textColorBlack,
                  press: () {
                    putIsSeeCv(data[index]['id'].toString());
                    putIsSee(data[index]['id'].toString());
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (
                          context,
                        ) =>
                                DetailCvVideoScreen(
                                  isCv: true,
                                  arrayData: data[index],
                                )));
                  },
                ))),
                Expanded(
                    child: Center(
                        child: ElipButton(
                  text: "Video",
                  colorBackground:
                      (data[index]['isSeeVideo'].toString() == "true")
                          ? colorIsSee
                          : colorWhite,
                  textColor: (data[index]['isSeeVideo'].toString() == "true")
                      ? textColorWhite
                      : textColorBlack,
                  press: () {
                    putIsSeeVideo(data[index]['id'].toString());
                    putIsSee(data[index]['id'].toString());
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailCvVideoScreen(
                                  isCv: false,
                                  arrayData: data[index],
                                )));
                  },
                )))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ElipButton extends StatelessWidget {
  const ElipButton(
      {Key? key,
      required this.text,
      required this.press,
      this.colorBackground = colorWhite,
      this.textColor = textColorBlack})
      : super(key: key);

  final String text;
  final GestureTapCallback press;
  final Color colorBackground, textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
              color: colorBackground,
              borderRadius: const BorderRadius.all(Radius.elliptical(100, 50)),
              border: Border.all(
                color: colorBorder,
                width: 2,
              )),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          )),
    );
  }
}
