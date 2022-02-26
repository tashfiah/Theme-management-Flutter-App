import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:theme_management_app/first_screen.dart';

void main() async {
  await GetStorage.init(); //get storage initialization
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themedata = GetStorage();
  @override
  Widget build(BuildContext context) {
    bool darkMode = themedata.read('darkmode') ?? false;

    return GetMaterialApp(
      theme: darkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}
