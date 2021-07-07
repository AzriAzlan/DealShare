import 'package:dealshare/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DealTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.white,
                  child: Image(
                    image: AssetImage('assets/nikeLogo.png'),
                  ),
                ),
                trailing: GestureDetector(
                  child: Icon(Icons.share),
                  onTap: () {
                    Share.share('check out my website https://example.com');
                  },
                ),
                title: SizedBox(
                  width: 100,
                  height: 50,
                  child: Image(
                        image: AssetImage('assets/5star.png'),
                      ),
                ),
                    //FittedBox(fit: BoxFit.fitWidth,child: Text("45 Ratings")),

                subtitle: Column(
                  children: <Widget>[
                    Text("45 Ratings"),
                    Text(
                      "50% off from latest shoes!",maxLines: 1,overflow: TextOverflow.ellipsis,softWrap: false,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 20),
                    Text(
                        "Get 50% off from latest shoes when you have a minimum purchase of RM400 in a single receipt",maxLines: 1,overflow: TextOverflow.ellipsis,softWrap: false,),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
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
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
