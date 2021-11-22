import 'package:flutter/material.dart';
import 'package:mini_project/src/configs/app_route.dart';
class Menu {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function(BuildContext context) onTap;


  const Menu({
    this.title,
    this.icon,
    this.iconColor = Colors.grey,
    this.onTap,
  });
}


class MenuViewNoModel {
  MenuViewNoModel();


  List<Menu> get items => <Menu>[
    Menu(
      iconColor: Colors.orangeAccent,
      title: 'ประเภทห้องเช่า',
      icon: Icons.home_filled,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.roomtypenoRoutr);
      },
    ),
    Menu(
      iconColor: Colors.orangeAccent,
      title: 'เปรียบเทียบราคาห้องเช่า',
      icon: Icons.money_off,
      onTap: (context) {
        //Navigator.pushNamed(context, Constant.mapRoute);
      },
    ),
    Menu(
      iconColor: Colors.orangeAccent,
      title: 'ลงชื่อเข้าใช้',
      icon: Icons.add_circle,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.loginRoute);
      },
    ),

  ];
}