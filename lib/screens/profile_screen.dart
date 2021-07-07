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
    SizeConfig().init(context);


    return Scaffold(
      body: Container(
        height: SizeConfig.safeBlockVertical*100,
        width: SizeConfig.safeBlockHorizontal*100,
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
                      height: 350.0,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage(
                               'assets/profilepicture.png',
                              ),
                              radius: 50.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Azri D",
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Card(
                              margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                              clipBehavior: Clip.antiAlias,
                              color: Colors.white,
                              elevation: 5.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(

                                        children: <Widget>[
                                          Text(
                                            "Member Since",
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              //fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
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
                                            height: 5.0,
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
                                            height: 5.0,
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

                      Padding(padding: EdgeInsets.all(15),child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SavedDeals()),
                            );
                          },
                          child: Text(" VIEW SAVED DEALS",style: TextStyle(fontSize: 15),)),),

                      Expanded(
                          child: Divider(color: Colors.grey,)
                      ),
                    ]
                ),



                       Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Recent Activity:",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 28.0
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),

                              Container(
                                  height: 100,
                                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withAlpha(100), blurRadius: 10.0),
                                      ]),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 20.0,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            radius: 20.0,
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
                                              height: 25,
                                            ),
                                            Text(
                                              '50% off from latest shoes',
                                              style: const TextStyle(
                                                  fontSize: 13, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Date received - 24/7/2021',
                                              style:
                                              const TextStyle(fontSize: 12, color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '+5',
                                          style: const TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )),


                              Container(
                                  height: 100,
                                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withAlpha(100), blurRadius: 10.0),
                                      ]),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 20.0,
                                          backgroundColor: Colors.white,
                                          child: Image(
                                            image: AssetImage('assets/nikeLogo.png'),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Text(
                                              '50% off from latest shoes',
                                              style: const TextStyle(
                                                  fontSize: 13, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Date received - 24/7/2021',
                                              style:
                                              const TextStyle(fontSize: 12, color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '+2',
                                          style: const TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )),

                              Container(
                                  height: 100,
                                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withAlpha(100), blurRadius: 10.0),
                                      ]),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 20.0,
                                          backgroundColor: Colors.white,
                                          child: Image(
                                            image: AssetImage('assets/nikeLogo.png'),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Text(
                                              '50% off from latest shoes',
                                              style: const TextStyle(
                                                  fontSize: 13, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Date received - 24/7/2021',
                                              style:
                                              const TextStyle(fontSize: 12, color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '+1',
                                          style: const TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )),
                              SizedBox(height:20),
                              Center(
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
