import 'package:flutter/material.dart';
import 'package:mini_project/src/pages/addroom/add_room_page.dart';
import 'package:mini_project/src/pages/apartment/apartment_page.dart';
import 'package:mini_project/src/pages/condo/add_room_condo_page.dart';
import 'package:mini_project/src/pages/condo/condo_detail_page.dart';
import 'package:mini_project/src/pages/condo/condo_page.dart';
import 'package:mini_project/src/pages/dormitory/dormitory_page.dart';
import 'package:mini_project/src/pages/home/home_no_login_page.dart';
import 'package:mini_project/src/pages/home/home_page.dart';
import 'package:mini_project/src/pages/info/info_page.dart';
import 'package:mini_project/src/pages/login/login_page.dart';
import 'package:mini_project/src/pages/mansion/mansion_page.dart';
import 'package:mini_project/src/pages/register/register_page.dart';
import 'package:mini_project/src/pages/roomtype/room_type_no_page.dart';
import 'package:mini_project/src/pages/roomtype/room_type_page.dart';

class AppRoute{
  static const homeRoute = 'home';
  static const infoRoute = 'info';
  static const loginRoute = 'login';
  static const registerRoute = 'register';
  static const condoRoutr = 'condo';
  static const apartmentRoutr = 'apartment';
  static const mansionRoutr = 'mansion';
  static const dormitoryRoutr = 'dormitory';
  static const roomtypeRoutr = 'roomtype';
  static const homenologinRoutr = 'homenologin';
  static const roomtypenoRoutr = 'roomtypeno';
  static const addroomRoutr = 'addroom';
  static const condodetailRoutr = 'condodetail';
  static const addroomcondoRoutr = 'addroomcondo';


  final _route = <String, WidgetBuilder>{
    homeRoute: (comtext) => HomePage(),
    infoRoute: (comtext) => InfoPage(),
    loginRoute: (comtext) => LoginPage(),
    registerRoute: (comtext) => RegisterPage(),
    condoRoutr: (comtext) => CondoPage(),
    apartmentRoutr: (comtext) => ApartmentPage(),
    mansionRoutr: (comtext) => mansionPages(),
    dormitoryRoutr: (comtext) => DormitoryPage(),
    roomtypeRoutr: (comtext) => RoomtypePage(),
    homenologinRoutr: (comtext) => HomeNoLoginPage(),
    roomtypenoRoutr: (comtext) => RoomTypeNoPage(),
    addroomRoutr: (comtext) => AddRoomPage(),
    condodetailRoutr: (comtext) => CondoDetailPage(),
    addroomcondoRoutr: (comtext) => AddRoomCondoPage(),

  };

  get getAll => _route;
}//end class