import 'package:dealshare/screens/deal_registration_screen.dart';
import 'package:dealshare/screens/login_screen.dart';
import 'package:dealshare/screens/profile_screen.dart';
import 'package:dealshare/screens/redeem_screen.dart';
import 'package:dealshare/screens/saved_deals.dart';
import 'package:dealshare/services/auth.dart';
import 'package:dealshare/services/database.dart';
import 'package:dealshare/size_config.dart';
import 'package:dealshare/widgets/deal_tile.dart';
import 'package:dealshare/widgets/deals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Authenticate _auth = Authenticate();
  final int _selectedIndex = 0;
  List userDetails;
  String name="";
  String photoURL="";
  bool _showBackToTopButton = false;
  ScrollController scrollController;


  @override
  void initState() {
    getUserDetails();
    super.initState();
    scrollController = new ScrollController()
      ..addListener(() {
        setState(() {
          if (scrollController.offset >= 32 * SizeConfig.heightMultiplier) {
            _showBackToTopButton = true; // show the back-to-top button

          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  void getUserDetails () async {
    userDetails = await DatabaseService().getUserDetails();
    name=userDetails[0];
    photoURL=userDetails[2];
    setState(() {
      userDetails=userDetails;
      name=name;
      photoURL=photoURL;
    });
  }

  void toTop() {
    scrollController.animateTo(0,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {

    var shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;

    useMobileLayout?SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]):null;

    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.cyan,
                ),
                child: Row(
                  children: [

                    FadeInImage.assetNetwork(
                        placeholder: 'assets/profilepicture.png',
                      image:"$photoURL",
                        width: 12 * SizeConfig.widthMultiplier,
                      ),


                    SizedBox(
                      width: 7 * SizeConfig.widthMultiplier,
                    ),
                    Text(
                      "$name",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.redeem),
                title: Text('Redeem Points'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Redeempage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text('Register a deal'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DealRegistration()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap:  () async {
                  await _auth.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),

            ],
          ),
        ),
        body: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 26 * SizeConfig.heightMultiplier,
              backgroundColor: Colors.cyan,
              flexibleSpace: FlexibleSpaceBar(
                background: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.blueAccent, Colors.cyan]),
                    ),
                    child: SafeArea(
                      child: Column(
                        children: [

                          Padding(
                            padding: EdgeInsets.only(top:1.5*SizeConfig.heightMultiplier),
                            child: Text(
                              "Hot Deals",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2 * SizeConfig.heightMultiplier),
                            ),
                          ),
                          
                          SizedBox(
                            child: DealTile(),
                            height: 21.5 * SizeConfig.heightMultiplier,
                            //DealTile(),
                          ),
                      
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(1.6 * SizeConfig.heightMultiplier),
              sliver: Deals(),
            ),
          ],
        ),
        floatingActionButton: _showBackToTopButton == false
            ? null
            : FloatingActionButton(
                backgroundColor: Colors.cyan,
                onPressed: toTop,
                child: Icon(Icons.arrow_upward),
              ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          backgroundColor: Colors.cyan,
          unselectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
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
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SavedDeals()),
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
