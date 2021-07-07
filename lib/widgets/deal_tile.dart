import 'package:dealshare/images.dart';
import 'package:dealshare/screens/details_screen.dart';
import 'package:dealshare/size_config.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:dealshare/styling.dart';


class DealTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(

        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(0.0),
              child: Card(
                margin: EdgeInsets.fromLTRB(2*SizeConfig.heightMultiplier, 3*SizeConfig.heightMultiplier, 2*SizeConfig.heightMultiplier, 2*SizeConfig.heightMultiplier),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailsPage()));
                  },
                  child: ListTile(
                    leading: Image.asset(
                        Images.nikeLogo,
                        width: 12*SizeConfig.widthMultiplier,
                      ),
                    //),
                    trailing: GestureDetector(
                      child: Icon(Icons.share,size: 5*SizeConfig.imageSizeMultiplier,),
                      onTap: () {
                        Share.share('check out my website https://example.com');
                      },
                    ),
                    title: SizedBox(
                      width: 13*SizeConfig.widthMultiplier,
                      height: 4*SizeConfig.heightMultiplier,
                      child:Image.asset(
                        Images.fiveStar,
                      ),
                    ),
                        //FittedBox(fit: BoxFit.fitWidth,child: Text("45 Ratings")),

                    subtitle: Column(
                      children: <Widget>[
                        FittedBox(child: Text("45 Ratings")),
                        FittedBox(
                          child: Text(
                            "50% off from latest shoes!",
                            style:
                                Theme.of(context).textTheme.title,
                          ),
                        ),
                        FittedBox(
                          child: Text(
                              "Get 50% off from Nike's latest shoes (T&C apply)",
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                        ),
                        SizedBox(height: 1.5*SizeConfig.heightMultiplier),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
