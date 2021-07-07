import 'package:dealshare/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Deals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    );

    return Wrap(
          direction: Axis.horizontal,
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 12.0, // gap between lines
          children: <Widget>[

      SizedBox(
        width: 350,
        child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: border,
                child: Column(children: <Widget>[
                  Image(
                    height: 120,
                    width: 120,
                    image: AssetImage('assets/nikeLogo.png'),
                  ),
                  Text("Nike"),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        width: 100,
                        image: AssetImage('assets/5star.png'),
                      ),
                      Text("45 Ratings"),
                    ],
                  ),
                  Text(
                    "50% off from latest shoes!",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DetailsPage()));
                    },
                    child: Text("VIEW"),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.green),
                    ),
                  ),
                  SizedBox(height: 10,),
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


    SizedBox(
      width: 350,
      child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: border,
              child: Column(children: <Widget>[
                Image(
                  height: 120,
                  width: 120,
                  image: AssetImage('assets/touchgo.png'),
                ),
                Text("Nike"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 100,
                      image: AssetImage('assets/5star.png'),
                    ),
                    Text("45 Ratings"),
                  ],
                ),
                Text(
                  "50% off from latest shoes!",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailsPage()));
                  },
                  child: Text("VIEW"),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.green),
                  ),
                ),
                SizedBox(height: 10,),
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

    SizedBox(
      width: 350,
      child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: border,
              child: Column(children: <Widget>[
                Image(
                  height: 120,
                  width: 120,
                  image: AssetImage('assets/starbucks.png'),
                ),
                Text("Nike"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 100,
                      image: AssetImage('assets/5star.png'),
                    ),
                    Text("45 Ratings"),
                  ],
                ),
                Text(
                  "50% off from latest shoes!",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailsPage()));
                  },
                  child: Text("VIEW"),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.green),
                  ),
                ),
                SizedBox(height: 10,),
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

        SizedBox(
          width: 350,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: border,
              child: Column(children: <Widget>[
                Image(
                  height: 120,
                  width: 120,
                  image: AssetImage('assets/mcdonalds.png'),
                ),
                Text("Nike"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 100,
                      image: AssetImage('assets/5star.png'),
                    ),
                    Text("45 Ratings"),
                  ],
                ),
                Text(
                  "50% off from latest shoes!",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailsPage()));
                  },
                  child: Text("VIEW"),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.green),
                  ),
                ),
                SizedBox(height: 10,),
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


        SizedBox(
          width: 350,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: border,
              child: Column(children: <Widget>[
                Image(
                  height: 120,
                  width: 120,
                  image: AssetImage('assets/nikeLogo.png'),
                ),
                Text("Nike"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 100,
                      image: AssetImage('assets/5star.png'),
                    ),
                    Text("45 Ratings"),
                  ],
                ),
                Text(
                  "50% off from latest shoes!",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailsPage()));
                  },
                  child: Text("VIEW"),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.green),
                  ),
                ),
                SizedBox(height: 10,),
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

        SizedBox(
          width: 350,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: border,
              child: Column(children: <Widget>[
                Image(
                  height: 120,
                  width: 120,
                  image: AssetImage('assets/nikeLogo.png'),
                ),
                Text("Nike"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 100,
                      image: AssetImage('assets/5star.png'),
                    ),
                    Text("45 Ratings"),
                  ],
                ),
                Text(
                  "50% off from latest shoes!",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailsPage()));
                  },
                  child: Text("VIEW"),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.green),
                  ),
                ),
                SizedBox(height: 10,),
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
