import 'package:digitaltrons/constants.dart';
import 'package:flutter/material.dart';

class Countries extends StatelessWidget {
  //const Countries({Key? key}) : super(key: key);

  final Color? color;
  final String? title;
  const Countries(this.title, this.color, {Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title.toString(),
          style: TextStyle(
            color: Constants.tileColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: color,
        elevation: 0,
      ),
      body: Container(),
    );
  }
}
