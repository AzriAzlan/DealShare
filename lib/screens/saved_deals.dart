import 'package:dealshare/images.dart';
import 'package:dealshare/screens/home_screen.dart';
import 'package:dealshare/screens/profile_screen.dart';
import 'package:dealshare/size_config.dart';
import 'package:dealshare/widgets/deals.dart';
import 'package:flutter/material.dart';

class SavedDeals extends StatelessWidget {
  List<String> images = [
    Images.nikeLogo,
    Images.touchGo,
    Images.starbucks,
    Images.mcdetails,
    Images.nikedetails,
    Images.mcdonalds
  ];
  int _selectedIndex = 1;
  final border =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0));

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    //
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          automaticallyImplyLeading: false,
          title: Text("Saved Deals"),
          centerTitle: true,
        ),

        body: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.all(1.6 * SizeConfig.heightMultiplier),
              sliver: Deals(),
            ),
          ],

        ),


        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          backgroundColor: Colors.cyan,
          unselectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.portrait),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (_selectedIndex) {
            switch (_selectedIndex) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
                break;

              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
            }
          },
        ),
      ),
    );
  }
}
