import 'package:dealshare/images.dart';
import 'package:dealshare/screens/details_screen.dart';
import 'package:dealshare/size_config.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Deals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    );

    return GridView.count(
      primary: false,
      padding: EdgeInsets.all(1.6 * SizeConfig.heightMultiplier),
      crossAxisSpacing: 1.2 * SizeConfig.widthMultiplier,
      mainAxisSpacing: 1.2 * SizeConfig.widthMultiplier,
      crossAxisCount: 2,
      children: <Widget>[


        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailsPage()));
          },
          child: Padding(
            padding: EdgeInsets.all(0.6 * SizeConfig.heightMultiplier),
            child: Card(
              shape: border,
              child: Column(children: <Widget>[
                Image.asset(
                  Images.nikeLogo,
                  width: 17 * SizeConfig.widthMultiplier,
                ),
                Text("Nike"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Images.fiveStar,
                      width: 17 * SizeConfig.widthMultiplier,
                    ),
                    FittedBox(child: Text("45 Ratings")),
                  ],
                ),
                Text(
                  "50% off from latest shoes!",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 1.6 * SizeConfig.heightMultiplier),
                GestureDetector(
                  child: Icon(Icons.share),
                  onTap: () {
                    Share.share('check out my website https://example.com');
                  },
                ),
              ]),
              //color: Colors.teal[100],
            ),
          ),
        ),


        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailsPage()));
          },
          child: Padding(
            padding: EdgeInsets.all(0.6 * SizeConfig.heightMultiplier),
            child: Card(
              shape: border,
              child: Column(children: <Widget>[
                Image.asset(
                  Images.touchGo,
                  width: 17 * SizeConfig.widthMultiplier,
                ),
                Text("Nike"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Images.fiveStar,
                      width: 17 * SizeConfig.widthMultiplier,
                    ),
                    FittedBox(child: Text("45 Ratings")),
                  ],
                ),
                Text(
                  "50% off from latest shoes!",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 1.6 * SizeConfig.heightMultiplier),
                GestureDetector(
                  child: Icon(Icons.share),
                  onTap: () {
                    Share.share('check out my website https://example.com');
                  },
                ),
              ]),
              //color: Colors.teal[100],
            ),
          ),
        ),


        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailsPage()));
          },
          child: Padding(
            padding: EdgeInsets.all(0.6 * SizeConfig.heightMultiplier),
            child: Card(
              shape: border,
              child: Column(children: <Widget>[
                Image.asset(
                  Images.starbucks,
                  width: 17 * SizeConfig.widthMultiplier,
                ),
                Text("Nike"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Images.fiveStar,
                      width: 17 * SizeConfig.widthMultiplier,
                    ),
                    FittedBox(child: Text("45 Ratings")),
                  ],
                ),
                Text(
                  "50% off from latest shoes!",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 1.6 * SizeConfig.heightMultiplier),
                GestureDetector(
                  child: Icon(Icons.share),
                  onTap: () {
                    Share.share('check out my website https://example.com');
                  },
                ),
              ]),
              //color: Colors.teal[100],
            ),
          ),
        ),


        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailsPage()));
          },
          child: Padding(
            padding: EdgeInsets.all(0.6 * SizeConfig.heightMultiplier),
            child: Card(
              shape: border,
              child: Column(children: <Widget>[
                Image.asset(
                  Images.mcdonalds,
                  width: 17 * SizeConfig.widthMultiplier,
                ),
                Text("Nike"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Images.fiveStar,
                      width: 17 * SizeConfig.widthMultiplier,
                    ),
                    FittedBox(child: Text("45 Ratings")),
                  ],
                ),
                Text(
                  "50% off from latest shoes!",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 1.6 * SizeConfig.heightMultiplier),
                GestureDetector(
                  child: Icon(Icons.share),
                  onTap: () {
                    Share.share('check out my website https://example.com');
                  },
                ),
              ]),
              //color: Colors.teal[100],
            ),
          ),
        ),


        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailsPage()));
          },
          child: Padding(
            padding: EdgeInsets.all(0.6 * SizeConfig.heightMultiplier),
            child: Card(
              shape: border,
              child: Column(children: <Widget>[
                Image.asset(
                  Images.nikeLogo,
                  width: 17 * SizeConfig.widthMultiplier,
                ),
                Text("Nike"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Images.fiveStar,
                      width: 17 * SizeConfig.widthMultiplier,
                    ),
                    FittedBox(child: Text("45 Ratings")),
                  ],
                ),
                Text(
                  "50% off from latest shoes!",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 1.6 * SizeConfig.heightMultiplier),
                GestureDetector(
                  child: Icon(Icons.share),
                  onTap: () {
                    Share.share('check out my website https://example.com');
                  },
                ),
              ]),
              //color: Colors.teal[100],
            ),
          ),
        ),
      ],
    );
  }
}
