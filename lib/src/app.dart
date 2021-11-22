import 'package:flutter/material.dart';
import 'package:mini_project/src/configs/app_route.dart';
import 'package:mini_project/src/configs/app_setting.dart';
import 'package:mini_project/src/pages/home/home_no_login_page.dart';
import 'package:mini_project/src/pages/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoute().getAll,
      theme: ThemeData(primaryColor: Colors.lightBlueAccent),
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              color: Colors.white,
            );
          } else {
            final token =
            snapshot.data.getString(AppSetting.userNameSetting ?? '');
            if (token != null) {
              return HomeNoLoginPage();
            } else {
              //return LoginPage();
              return HomeNoLoginPage();
            }
          }
        },
      ),
    );
  }
} //end class
