import 'package:dealshare/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DealTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context,index){
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 35.0,
                backgroundColor: Colors.white,
                child:  Image(
                  image: AssetImage('assets/nikeLogo.png'),
                ),
              ),
              trailing: GestureDetector(child: Icon(Icons.info_outline) ,onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));},),
              title: Row(
                children: <Widget>[
                  Image(
                    width: 100,
                    image: AssetImage('assets/5star.png'),
                  ),

                  Text("45 Ratings"),
                ],
              ),
              subtitle: Column(
                children: <Widget>[
                  Text(
                      "50% off from latest shoes!",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Get 50% off from latest shoes when you have a minimum purchase of RM400 in a single receipt"

                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {

                        Share.share('check out my website https://example.com');

                      },
                      child: Text("Share"),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
