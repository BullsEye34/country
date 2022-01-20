import 'package:digitaltrons/constants.dart';
import 'package:digitaltrons/views/countries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Regions extends StatelessWidget {
  const Regions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(80),
            //vertical: ScreenUtil().setHeight(100),
          ),
          height: ScreenUtil().setHeight(1900),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              size200(),
              Text(
                "Regions",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(100),
                  color: Constants.headingColor,
                ),
              ),
              size200(),
              regionList(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox size200() {
    return SizedBox(
      height: ScreenUtil().setHeight(
        200,
      ),
    );
  }

  Container regionList() {
    return Container(
      height: ScreenUtil().setHeight(1200),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => Countries(
                  Constants.region[index]["name"].toString(),
                  Constants.region[index]["color"] as Color),
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: ScreenUtil().setHeight(50),
            ),
            height: ScreenUtil().setHeight(200),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  ScreenUtil().setWidth(50),
                ),
                color: Constants.region[index]["color"] as Color,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(50),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Constants.region[index]["name"].toString(),
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(
                        50,
                      ),
                      color: Constants.tileColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        itemCount: Constants.region.length,
      ),
    );
  }
}
