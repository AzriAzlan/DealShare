import 'package:dealshare/screens/home_screen.dart';
import 'package:dealshare/images.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nike Promo"),
        automaticallyImplyLeading: true,
        centerTitle: true,

        actionsIconTheme: IconThemeData(
          size: 30.0 
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Image.asset(
                  Images.nikeLogo,
                ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.fiveStar,
                    width: 150,
                  ),
                  Text("45 Ratings"),
                ],
              ),

            ],
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            child: Text(
            '50% off from latest shoes!',
            textScaleFactor: 1.7,
          ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 5, 30, 5),
            padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
            child: Text(
            'Get 50% off from latest shoes when you have a minimum purchase of RM400 in a single receipt',
            textScaleFactor: 1.15,
          ),
          ),

          Text(
            'ABC12345',
            textScaleFactor: 1.7,
          ),


          SizedBox(height:20),
          Text("Valid until 15/5/2021"),
          SizedBox(height: 20,),
          SizedBox(
            width: 600,
            height: 40,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
               foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
               ),
              onPressed: () {

                showDialog(
                    context: context,
                    builder: (_) => AssetGiffyDialog(
                      image: Image.asset(
                        Images.nikeLogo,
                      ),
                      title: Text(
                        'Saved this promo code!',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600),
                      ),
                      description: Text(
                        'Valid until 15/5/2021 .You may view this saved promo in your profile section.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      entryAnimation: EntryAnimation.BOTTOM_RIGHT,
                      onOkButtonPressed: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );


                      },
                    ));
              },
              child: Text('SAVE THIS PROMO CODE'),
            ),
          ),
        ],
      ),
    );
  }
}

