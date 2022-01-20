import 'package:digitaltrons/provider/states.dart';
import 'package:digitaltrons/views/regions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<States>(
      create: (context) => States(),
      child: ScreenUtilInit(
          designSize: const Size(1080, 1920),
          builder: () => const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Regions(),
              )),
    );
  }
}
