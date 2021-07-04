import 'package:dealshare/screens/deal_registration_screen.dart';
import 'package:dealshare/screens/profile_screen.dart';
import 'package:dealshare/screens/redeem_screen.dart';
import 'package:dealshare/widgets/deal_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomeScreen extends StatelessWidget {
  final int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text("Deals Page"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(child: Row(
            children: [
              Icon(Icons.add),
              Center(child: Text("New Deal"),),
            ],
          ),onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => DealRegistration())); },),
        ],
      ),
      body: Container(
        child: SizedBox(
          child: DealTile(),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.redeem),
            label: 'Redeem Points',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.portrait),
            label: 'My Profile',
          ),
        ],

        currentIndex: _selectedIndex,
        onTap:  (_selectedIndex) {
          switch(_selectedIndex) {
            case 1:
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Redeempage()),
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

    );
  }
}
