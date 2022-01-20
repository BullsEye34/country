import 'package:digitaltrons/constants.dart';
import 'package:digitaltrons/provider/states.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Countries extends StatelessWidget {
  //const Countries({Key? key}) : super(key: key);

  final Color? color;
  final String? title;
  const Countries(this.title, this.color, {Key? key});

  @override
  Widget build(BuildContext context) {
    States provider = Provider.of<States>(context, listen: false);
    provider.getCountriedByRegion(title!);
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
