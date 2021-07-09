
import 'package:dealshare/images.dart';
import 'package:dealshare/screens/details_screen.dart';
import 'package:dealshare/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:share_plus/share_plus.dart';
import 'package:dealshare/styling.dart';

class DealTile extends StatelessWidget {
  List<String> images = [
    Images.nikeLogo,
    Images.touchGo,
    Images.starbucks,
    Images.mcdetails,
    Images.nikedetails,
    Images.mcdonalds
  ];
  final border =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0));
  Color offwhite = Color(0xfff8f8ff);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24 * SizeConfig.heightMultiplier,
      //color: Colors.red,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Container(
              width: 51*SizeConfig.widthMultiplier,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailsPage()));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(0.6 * SizeConfig.heightMultiplier),
                    child: Card(
                      color: offwhite,
                      shape: border,
                      child: Column(children: <Widget>[
                        SizedBox(height: 0.8*SizeConfig.heightMultiplier,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              2 * SizeConfig.heightMultiplier),
                          child: Image.asset(
                            index >= 5 ? images[index - 5] : images[index],
                            width: 17 * SizeConfig.widthMultiplier,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.fiveStar,
                              width: 17 * SizeConfig.widthMultiplier,
                            ),
                            //FittedBox(child: Text("45 Ratings")),
                          ],
                        ),
                        FittedBox(
                          child: Text(
                            index%3==0?"Buy 1 Free 1!":"\$10 off sale",style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.access_time,color: index%3==0?Colors.grey:Colors.red,size: 2.2*SizeConfig.heightMultiplier,),
                            Text(index%3==0?"June 10":"May 25"),
                          ],
                        ),
                        //SizedBox(height: 1.6 * SizeConfig.heightMultiplier),
                        // GestureDetector(
                        //   child: Icon(Icons.favorite,
                        //       color: index % 3 == 0 ? Colors.red : Colors.grey),
                        //   onTap: () {
                        //     Share.share(
                        //         'check out my website https://example.com');
                        //   },
                        // ),
                      ]),
                      //color: Colors.teal[100],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: 5,
        viewportFraction: 0.7,
        scale: 0.8,
        itemWidth: MediaQuery.of(context).size.width,
        layout: SwiperLayout.STACK,
      ),
    );

    // return Container(
    //
    //     child: ListView.builder(
    //       itemCount: 1,
    //       itemBuilder: (context, index) {
    //         return Padding(
    //           padding: EdgeInsets.all(0.0),
    //           child: Card(
    //             margin: EdgeInsets.fromLTRB(2*SizeConfig.heightMultiplier, 3*SizeConfig.heightMultiplier, 2*SizeConfig.heightMultiplier, 2*SizeConfig.heightMultiplier),
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //             child: GestureDetector(
    //               onTap: () {
    //                 Navigator.push(context,
    //                     MaterialPageRoute(builder: (context) => DetailsPage()));
    //               },
    //               child: ListTile(
    //                 leading: Image.asset(
    //                     Images.nikeLogo,
    //                     width: 12*SizeConfig.widthMultiplier,
    //                   ),
    //                 //),
    //                 trailing: GestureDetector(
    //                   child: Icon(Icons.favorite,size: 5*SizeConfig.imageSizeMultiplier,),
    //                   onTap: () {
    //                     Share.share('check out my website https://example.com');
    //                   },
    //                 ),
    //                 title: SizedBox(
    //                   width: 13*SizeConfig.widthMultiplier,
    //                   height: 4*SizeConfig.heightMultiplier,
    //                   child:Image.asset(
    //                     Images.fiveStar,
    //                   ),
    //                 ),
    //                     //FittedBox(fit: BoxFit.fitWidth,child: Text("45 Ratings")),
    //
    //                 subtitle: Column(
    //                   children: <Widget>[
    //                     FittedBox(child: Text("45 Ratings")),
    //                     FittedBox(
    //                       child: Text(
    //                         "50% off from latest shoes!",
    //                         style:
    //                             Theme.of(context).textTheme.title,
    //                       ),
    //                     ),
    //                     FittedBox(
    //                       child: Text(
    //                           "Get 50% off from Nike's latest shoes (T&C apply)",
    //                         style: Theme.of(context).textTheme.subtitle,
    //                       ),
    //                     ),
    //                     SizedBox(height: 1.5*SizeConfig.heightMultiplier),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         );
    //       }),
    // );
  }
}
