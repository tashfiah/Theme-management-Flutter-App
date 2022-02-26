import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final themedata = GetStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    themedata.writeIfNull("darkmode", false);
    bool isdarkMode = themedata.read("darkmode");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: Text('Theme Management App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Tashfiah"),
              accountEmail: Text("tashfiahme20011@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/day.png"),
              ),
              decoration: BoxDecoration(
                  color: isdarkMode ? Colors.black : Colors.lime,
                  image: DecorationImage(
                      image: AssetImage("assets/giphy.gif"),
                      fit: BoxFit.cover)),
            ),
            SwitchListTile(
              secondary: Icon(Icons.ac_unit),
              title: Text("Theme"),
              value: isdarkMode,
              onChanged: (value) {
                setState(() {
                  isdarkMode = value;
                });
                isdarkMode
                    ? Get.changeTheme(ThemeData.dark())
                    : Get.changeTheme(ThemeData.light());
                themedata.write('darkmode', value);
              },
              activeThumbImage: AssetImage("assets/half-moon.png"),
              inactiveThumbImage: AssetImage("assets/sun.png"),
              activeColor: Colors.lime,
              inactiveTrackColor: Colors.grey,
            ),

            // ListTile(
            //   title: Text("New group"),
            //   leading: Icon(Icons.),
            // )
          ],
        ),
      ),
      // SwithListTile()
    );
  }
}
