import 'package:dealshare/images.dart';
import 'package:dealshare/screens/details_screen.dart';
import 'package:dealshare/size_config.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Deals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Color offwhite = Color(0xfff8f8ff);
    List <String> images = [Images.nikeLogo,Images.touchGo,Images.starbucks,Images.mcdetails,Images.nikedetails,Images.mcdonalds];
    var size = MediaQuery.of(context).size;
    final double itemHeight =  24*SizeConfig.heightMultiplier; //(size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
      //side: BorderSide(width: 1.0,style: BorderStyle.solid,color: Colors.grey,),
    );

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (itemWidth / itemHeight),
      ),
      // crossAxisSpacing: 1.2 * SizeConfig.widthMultiplier,
      // mainAxisSpacing: 1.2 * SizeConfig.widthMultiplier,
      // crossAxisCount: 2,
      // childAspectRatio: (itemWidth / itemHeight),
      delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsPage()));
              },
                child: Padding(
                  padding: EdgeInsets.all(0.6 * SizeConfig.heightMultiplier),
                  child: Card(
                    shape: border,
                    child: Column(children: <Widget>[
                      SizedBox(height: 1.4*SizeConfig.heightMultiplier,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2*SizeConfig.heightMultiplier),
                        child: Container(
                          child: Image.asset(
                            index>=5?images[index-5]:images[index],
                            width: 17 * SizeConfig.widthMultiplier,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Images.fiveStar,
                            width: 17 * SizeConfig.widthMultiplier,
                          ),
                         // FittedBox(child: Text("45 Ratings")),
                        ],
                      ),
                      FittedBox(
                        child: Text(
                            index%3==0?"Buy 1 Free 1!":"\$10 off sale",style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(height: 1.5 * SizeConfig.heightMultiplier),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Icon(Icons.access_time,color: index%3==0?Colors.grey:Colors.red,size: 2.2*SizeConfig.heightMultiplier,),
                            onTap: () {
                              Share.share('check out my website https://example.com');
                            },
                          ),
                          Text(index%3==0?" June 10":" May 25"),
                        ],
                      ),
                    ]),
                    color: offwhite,
                  ),
                ),

            );
          },
          childCount: 10,
      ),
    );
  }
}
