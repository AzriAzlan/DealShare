import 'package:dealshare/screens/login_screen.dart';
import 'package:dealshare/size_config.dart';
import 'package:dealshare/styling.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context,constraints) {
        return OrientationBuilder(
          builder: (context,orientation) {
            SizeConfig().init(constraints,orientation);
            return MaterialApp(
              theme: AppTheme.lightTheme,
              home: LoginScreen(),
            );
          },

        );
      },

    );

  }
}
