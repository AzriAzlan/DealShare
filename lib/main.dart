import 'package:dealshare/screens/login_screen.dart';
import 'package:dealshare/size_config.dart';
import 'package:dealshare/styling.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(

      future: _initialization,
      builder: (context,snapshot) {

        if(snapshot.hasError) {
          return Text('', textDirection: TextDirection.ltr);
        }

        if(snapshot.connectionState == ConnectionState.done) {
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
        return Text('', textDirection: TextDirection.ltr);
      }



    );

  }
}