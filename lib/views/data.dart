import 'package:digitaltrons/provider/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Data extends StatelessWidget {
  final String? country;
  final Color? color;
  Data(this.country, this.color, {Key? key});

  @override
  Widget build(BuildContext context) {
    States provider = Provider.of<States>(context, listen: false);
    provider.getCountryData(country!);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            provider.clearDataCountryData();
            Navigator.pop(context);
          },
        ),
        title: Text(country.toString()),
        centerTitle: true,
        backgroundColor: color,
        elevation: 0,
      ),
      body: Container(
        child: Consumer<States>(
          builder: (context, value, child) => (value.countryDataModel == null)
              ? const Center(child: CupertinoActivityIndicator())
              : Container(
                  height: ScreenUtil().setHeight(1700),
                  margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(100),
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      size200(),
                      flag(value),
                      size200(),
                      data("Commonly Called:",
                          value.countryDataModel!.name.common),
                      size50(),
                      data("Country Code:", value.countryDataModel!.cca2),
                      size50(),
                      data(
                          "Capital Of Country:",
                          (value.countryDataModel!.capital.isEmpty)
                              ? "N/A"
                              : value.countryDataModel!.capital[0]),
                      size50(),
                      data(
                          "Currency Name:",
                          value.countryDataModel!.currencies.values.toList()[0]
                              ["name"]),
                      size50(),
                      data("Country Population:",
                          value.countryDataModel!.population),
                      size50(),
                      data(
                          "Currency Denonym:",
                          value.countryDataModel!.demonyms.values.toList()[0]
                                  ["m"] +
                              " & " +
                              value.countryDataModel!.demonyms.values
                                  .toList()[0]["f"]),
                      size200(),
                      Text(
                        "Denonym is for Male & Female",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(40),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Image flag(States value) {
    return Image.network(
      value.countryDataModel!.flags.png,
      height: ScreenUtil().setHeight(300),
      width: ScreenUtil().setHeight(300),
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return SizedBox(
          width: ScreenUtil().setHeight(300),
          height: ScreenUtil().setHeight(300),
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.grey,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
    );
  }

  SizedBox size200() {
    return SizedBox(
      height: ScreenUtil().setHeight(
        200,
      ),
    );
  }

  SizedBox size50() {
    return SizedBox(
      height: ScreenUtil().setHeight(
        50,
      ),
    );
  }

  Container data(title, data) => Container(
        width: ScreenUtil().setWidth(500),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(
                    45,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: ScreenUtil().setWidth(400),
                child: Text(
                  data.toString(),
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(
                      50,
                    ),
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
