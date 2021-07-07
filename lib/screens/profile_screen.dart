import 'package:dealshare/screens/home_screen.dart';
import 'package:dealshare/screens/login_screen.dart';
import 'package:dealshare/screens/redeem_screen.dart';
import 'package:dealshare/screens/saved_deals.dart';
import 'package:dealshare/size_config.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  int _selectedIndex =2;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.blueAccent,Colors.cyan]
                        )
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 28*SizeConfig.heightMultiplier,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage(
                               'assets/profilepicture.png',
                              ),
                              radius: 8*SizeConfig.widthMultiplier,
                            ),
                            SizedBox(
                              height: 1*SizeConfig.heightMultiplier,
                            ),
                            Text(
                              "Azri D",
                              style: TextStyle(
                                fontSize: 1.7*SizeConfig.heightMultiplier,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 0.8*SizeConfig.heightMultiplier,
                            ),
                            Card(
                              margin: EdgeInsets.symmetric(horizontal: 2.7*SizeConfig.widthMultiplier,vertical: 0.7*SizeConfig.heightMultiplier),
                              clipBehavior: Clip.antiAlias,
                              color: Colors.white,
                              elevation: 5.0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1*SizeConfig.widthMultiplier,vertical: 1.7*SizeConfig.heightMultiplier),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(

                                        children: <Widget>[
                                          Text(
                                            "Member Since",
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.4*SizeConfig.heightMultiplier,
                                          ),
                                          Text(
                                            "18/8/2020",
                                            style: TextStyle(
                                              //fontSize: 20.0,
                                              color: Colors.cyan,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(

                                        children: <Widget>[
                                          Text(
                                            "Current Points",
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              //fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.4*SizeConfig.heightMultiplier,
                                          ),
                                          Text(
                                            "1006",
                                            style: TextStyle(
                                              //fontSize: 20.0,
                                              color: Colors.cyan,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(

                                        children: <Widget>[
                                          Text(
                                            "Class",
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              //fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.4*SizeConfig.heightMultiplier,
                                          ),
                                          Text(
                                            "Expert sharer",
                                            style: TextStyle(
                                              //fontSize: 20.0,
                                              color: Colors.cyan,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                ),


                Row(
                    children: <Widget>[
                      Expanded(
                          child: Divider(color: Colors.grey,)
                      ),

                      Padding(padding: EdgeInsets.all(1.2*SizeConfig.heightMultiplier),
                        child: SizedBox(
                          width: 34*SizeConfig.widthMultiplier,
                          height: 4*SizeConfig.heightMultiplier,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SavedDeals()),
                              );
                            },
                            child: Text(" VIEW SAVED DEALS",style: TextStyle(fontSize: 1.2*SizeConfig.heightMultiplier),)),
                        ),),

                      Expanded(
                          child: Divider(color: Colors.grey,)
                      ),
                    ]
                ),



                       Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.4*SizeConfig.heightMultiplier,horizontal: 2.2*SizeConfig.widthMultiplier),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Recent Activity:",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 2.2*SizeConfig.heightMultiplier,
                                ),
                              ),
                              SizedBox(
                                height: 0.8*SizeConfig.heightMultiplier,
                              ),

                              Container(
                                  height: 8*SizeConfig.heightMultiplier,
                                  margin: EdgeInsets.symmetric(horizontal: 2.5*SizeConfig.widthMultiplier, vertical: 0.8*SizeConfig.heightMultiplier),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withAlpha(100), blurRadius: 10.0),
                                      ]),
                                  child: Padding(
                                    padding:
                                     EdgeInsets.symmetric(horizontal: 2.7*SizeConfig.widthMultiplier, vertical: 0.8*SizeConfig.heightMultiplier),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 2.7*SizeConfig.widthMultiplier,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            radius: 2.7*SizeConfig.widthMultiplier,
                                            backgroundColor: Colors.white,
                                            child: Image(
                                              image: AssetImage('assets/nikeLogo.png'),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 2*SizeConfig.heightMultiplier,
                                            ),
                                            Text(
                                              '50% off from latest shoes',
                                              style: TextStyle(
                                                  fontSize: 1*SizeConfig.textMultiplier, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Date received - 24/7/2021',
                                              style:
                                              TextStyle(fontSize: 1*SizeConfig.textMultiplier, color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '+5',
                                          style: TextStyle(
                                              fontSize: 1.6*SizeConfig.textMultiplier, fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )),


                              Container(
                                  height: 8*SizeConfig.heightMultiplier,
                                  margin: EdgeInsets.symmetric(horizontal: 2.5*SizeConfig.widthMultiplier, vertical: 0.8*SizeConfig.heightMultiplier),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withAlpha(100), blurRadius: 10.0),
                                      ]),
                                  child: Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 2.7*SizeConfig.widthMultiplier, vertical: 0.8*SizeConfig.heightMultiplier),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 2.7*SizeConfig.widthMultiplier,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            radius: 2.7*SizeConfig.widthMultiplier,
                                            backgroundColor: Colors.white,
                                            child: Image(
                                              image: AssetImage('assets/nikeLogo.png'),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 2*SizeConfig.heightMultiplier,
                                            ),
                                            Text(
                                              '50% off from latest shoes',
                                              style: TextStyle(
                                                  fontSize: 1*SizeConfig.textMultiplier, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Date received - 24/7/2021',
                                              style:
                                              TextStyle(fontSize: 1*SizeConfig.textMultiplier, color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '+2',
                                          style: TextStyle(
                                              fontSize: 1.6*SizeConfig.textMultiplier, fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )),


                              Container(
                                  height: 8*SizeConfig.heightMultiplier,
                                  margin: EdgeInsets.symmetric(horizontal: 2.5*SizeConfig.widthMultiplier, vertical: 0.8*SizeConfig.heightMultiplier),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withAlpha(100), blurRadius: 10.0),
                                      ]),
                                  child: Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 2.7*SizeConfig.widthMultiplier, vertical: 0.8*SizeConfig.heightMultiplier),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 2.7*SizeConfig.widthMultiplier,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            radius: 2.7*SizeConfig.widthMultiplier,
                                            backgroundColor: Colors.white,
                                            child: Image(
                                              image: AssetImage('assets/nikeLogo.png'),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 2*SizeConfig.heightMultiplier,
                                            ),
                                            Text(
                                              '50% off from latest shoes',
                                              style: TextStyle(
                                                  fontSize: 1*SizeConfig.textMultiplier, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Date received - 24/7/2021',
                                              style:
                                              TextStyle(fontSize: 1*SizeConfig.textMultiplier, color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '+1',
                                          style: TextStyle(
                                              fontSize: 1.6*SizeConfig.textMultiplier, fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )),

                              SizedBox(height:1.6*SizeConfig.heightMultiplier),
                              Center(
                                child: SizedBox(
                                  width: 34*SizeConfig.widthMultiplier,
                                  height: 4*SizeConfig.heightMultiplier,
                                  child: ElevatedButton(
                                    child: Text("LOGOUT",style: TextStyle(color: Colors.white),),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.red),
                                    ),
                                    onPressed: () {



                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => LoginScreen()),
                                      );
                                    },
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),


              ],
            ),
          ),
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
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              break;

            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Redeempage()),
              );

          }
        },
      ),


    );


  }
}
