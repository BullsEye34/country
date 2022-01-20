import 'package:digitaltrons/constants.dart';
import 'package:digitaltrons/provider/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            provider.clearDataCountries();
            Navigator.pop(context);
          },
        ),
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
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(80),
        ),
        child: ListView(
          children: [
            size200(),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    provider.clearDataCountries();
                    Navigator.pop(context);
                  },
                  child: Text(
                    title.toString(),
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(60),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(20),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: ScreenUtil().setSp(50),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(20),
                ),
                Text(
                  "Countries",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(100),
                    color: Constants.headingColor,
                  ),
                ),
              ],
            ),
            size200(),
            listOfCountries(),
          ],
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

  Consumer<States> listOfCountries() {
    return Consumer<States>(
      builder: (context, value, child) => (value.countriesList == null)
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : Container(
              height: ScreenUtil().setHeight(1100),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(20),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setHeight(20),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: color),
                  height: ScreenUtil().setHeight(200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          value.countriesList![index].name.official,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(45),
                            color: Constants.tileColor,
                          ),
                        ),
                        subtitle: Text(
                          "Commonly: " +
                              value.countriesList![index].name.common,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(35),
                            color: Constants.tileColor,
                          ),
                        ),
                        leading: Image.network(
                          value.countriesList![index].flags.png,
                          height: ScreenUtil().setHeight(100),
                          width: ScreenUtil().setHeight(100),
                        ),
                      )
                    ],
                  ),
                ),
                itemCount: (value.countriesList == null)
                    ? 0
                    : value.countriesList!.length,
              ),
            ),
    );
  }
}
