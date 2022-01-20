import 'package:country/constants.dart';
import 'package:country/provider/states.dart';
import 'package:country/views/data.dart';
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
    TextEditingController controller = TextEditingController();
    States provider = Provider.of<States>(context, listen: false);
    provider.getCountriedByRegion(title!);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            provider.clearSearchData();
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
          physics: NeverScrollableScrollPhysics(),
          children: [
            size200(),
            heading(provider, context),
            size200(),
            Consumer<States>(builder: (context, value, child) {
              return TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSubmitted: (search) {
                  value.getCountriesBySearch(search.toString());
                },
              );
            }),
            size50(),
            listOfCountries(controller.text),
          ],
        ),
      ),
    );
  }

  Row heading(States provider, BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            provider.clearSearchData();
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

  Consumer<States> listOfCountries(search) {
    return Consumer<States>(
      builder: (context, value, child) => (value.countryList["data"].isEmpty)
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : (value.countryList["error"] == true &&
                  value.countryList["errorMessage"] == "502")
              ? Center(
                  child: Column(
                    children: [
                      Text(
                        "No Internet Connection.\n\nFetching last region's data from Cache",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(45),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      size50(),
                      SizedBox(
                        height: ScreenUtil().setHeight(1100),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => Data(
                                  value.countryList["data"]![index].name
                                      .official,
                                  color,
                                ),
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setHeight(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setHeight(20),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: color),
                              height: ScreenUtil().setHeight(200),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text(
                                      value.countryList["data"]![index].name
                                          .official,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(45),
                                        color: Constants.tileColor,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "Commonly: " +
                                          value.countryList["data"]![index].name
                                              .common,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(35),
                                        color: Constants.tileColor,
                                      ),
                                    ),
                                    leading: Image.network(
                                      value.countryList["data"]![index].flags
                                          .png,
                                      height: ScreenUtil().setHeight(100),
                                      width: ScreenUtil().setHeight(100),
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return SizedBox(
                                          width: ScreenUtil().setHeight(100),
                                          height: ScreenUtil().setHeight(100),
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.grey,
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          itemCount: (value.countriesList == null)
                              ? 0
                              : value.countriesList!.length,
                        ),
                      )
                    ],
                  ),
                )
              : (search == "" && value.countryDataList == null)
                  ? SizedBox(
                      height: ScreenUtil().setHeight(1100),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Data(
                                value.countryList["data"]![index].name.official,
                                color,
                              ),
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(20),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setHeight(20),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: color),
                            height: ScreenUtil().setHeight(200),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(
                                    value.countryList["data"]![index].name
                                        .official,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(45),
                                      color: Constants.tileColor,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Commonly: " +
                                        value.countryList["data"]![index].name
                                            .common,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(35),
                                      color: Constants.tileColor,
                                    ),
                                  ),
                                  leading: Image.network(
                                    value.countryList["data"]![index].flags.png,
                                    height: ScreenUtil().setHeight(100),
                                    width: ScreenUtil().setHeight(100),
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return SizedBox(
                                        width: ScreenUtil().setHeight(100),
                                        height: ScreenUtil().setHeight(100),
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.grey,
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        itemCount: (value.countriesList == null)
                            ? 0
                            : value.countriesList!.length,
                      ),
                    )
                  : SizedBox(
                      height: ScreenUtil().setHeight(1100),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Data(
                                value.countryList["data"]![index].name.official,
                                color,
                              ),
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(20),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setHeight(20),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: color),
                            height: ScreenUtil().setHeight(200),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(
                                    value.countryList["data"]![index].name
                                        .official,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(45),
                                      color: Constants.tileColor,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Commonly: " +
                                        value.countryList["data"]![index].name
                                            .common,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(35),
                                      color: Constants.tileColor,
                                    ),
                                  ),
                                  leading: Image.network(
                                    value.countryList["data"]![index].flags.png,
                                    height: ScreenUtil().setHeight(100),
                                    width: ScreenUtil().setHeight(100),
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return SizedBox(
                                        width: ScreenUtil().setHeight(100),
                                        height: ScreenUtil().setHeight(100),
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.grey,
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        itemCount: (value.countryDataList == null)
                            ? 0
                            : value.countryDataList!.length,
                      ),
                    ),
    );
  }
}
