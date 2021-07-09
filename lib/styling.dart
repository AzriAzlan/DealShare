import 'package:flutter/material.dart';
import 'package:dealshare/size_config.dart';

class AppTheme {

  AppTheme._();

  static const Color appBackgroundColor = Colors.white;


  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppTheme.appBackgroundColor,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
  );

  static final TextTheme lightTextTheme = TextTheme(
    title: _titleLight,
    subtitle: _subTitleLight,
    // button: _buttonLight,
    // display1: _greetingLight,
    // display2: _searchLight,
    // body1: _selectedTabLight,
    // body2: _unSelectedTabLight,
  );


  static final TextStyle _titleLight = TextStyle(
    color: Colors.black,
    fontSize: 0.8 * SizeConfig.textMultiplier,
  );

  static final TextStyle _subTitleLight = TextStyle(
    color: Colors.grey,
    fontSize: 1.2 * SizeConfig.textMultiplier,
    height: 1.5,
  );



}