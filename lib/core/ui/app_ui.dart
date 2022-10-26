import 'package:flutter/material.dart';

class AppUI{

  static MaterialColor mainColor = const MaterialColor(0xffF4BE25,{
    50:Color.fromRGBO(4,131,184, .1),
    100:Color.fromRGBO(4,131,184, .2),
    200:Color.fromRGBO(4,131,184, .3),
    300:Color.fromRGBO(4,131,184, .4),
    400:Color.fromRGBO(4,131,184, .5),
    500:Color.fromRGBO(4,131,184, .6),
    600:Color.fromRGBO(4,131,184, .7),
    700:Color.fromRGBO(4,131,184, .8),
    800:Color.fromRGBO(4,131,184, .9),
    900:Color.fromRGBO(4,131,184, 1),
  });

  static Color secondColor = const Color(0xffFF5500);
  static Color disableColor = const Color(0xffCFCFCF);
  static Color whiteColor = const Color(0xffffffff);
  static Color blackColor = const Color(0xff383838);
  static Color textColor = const Color(0xff343A40);
  static Color backgroundColor = const Color(0xffDDE0F2);
  static Color inputColor = const Color(0xffEEF0F8);
  static var blueColor = const Color(0xff6993FF);
  static Color activeColor = Colors.green;
  static Color shimmerColor = Colors.grey[350]!;
  static Color greyColor = const Color(0xff343A40);
  static Color errorColor = Colors.red;

  static String imgPath = "assets/images/";
  static String iconPath = "assets/icons/";

}