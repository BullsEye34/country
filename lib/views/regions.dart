import 'package:digitaltrons/constants.dart';
import 'package:digitaltrons/provider/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Regions extends StatelessWidget {
  const Regions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(100),
            vertical: ScreenUtil().setHeight(100),
          ),
          child: ListView.builder(
            itemBuilder: (context, index) => SizedBox(
              height: ScreenUtil().setHeight(150),
              child: Text(Constants.regions[index].toString()),
            ),
            itemCount: Constants.regions.length,
          ),
        ),
      ),
    );
  }
}
