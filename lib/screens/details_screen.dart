import 'package:dealshare/screens/home_screen.dart';
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
              'assets/nike_logo.jpeg',
              scale: 10,
            )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (
                  context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                   ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
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
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
             foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
             ),
            onPressed: () {

              showDialog(
                  context: context,
                  builder: (_) => AssetGiffyDialog(
                    image: Image(
                      image: AssetImage('assets/nikeLogo.png'),
                    ),
                    title: Text(
                      'Promo code : ABC12345',
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                      'Valid until 15/5/2021 .You may redeem your promo code at the online Nike store or any physical store',
                      textAlign: TextAlign.center,
                      style: TextStyle(),
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
            child: Text('Redeem Voucher'),
          ),
        ],
      ),
    );
  }
}

