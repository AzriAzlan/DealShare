import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealshare/images.dart';
import 'package:dealshare/screens/details_screen.dart';
import 'package:dealshare/size_config.dart';
import 'package:dealshare/widgets/ScaleRoute.dart';
import 'package:flutter/material.dart';
import 'package:dealshare/services/dealData.dart';

class Deals extends StatefulWidget {
  @override
  _DealsState createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  List<DealData> data = [];
  var counter = 0;
  void fetchData(){
    FirebaseFirestore.instance
        .collection("Deals")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((DocumentSnapshot doc) {
        DealData deals = DealData.fromMap(doc.data());
        setState(() {
          data.add(deals);
          counter = counter + 1;
        });
      });
      print(counter);
    });
  }

  @override
  void initState(){
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;
    Color offwhite = Color(0xfff8f8ff);
    var size = MediaQuery.of(context).size;
    var portrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final double itemHeight = useMobileLayout && portrait
        ? 24 * SizeConfig.heightMultiplier
        : 40 *
        SizeConfig
            .heightMultiplier; //(size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),

      //side: BorderSide(width: 1.0,style: BorderStyle.solid,color: Colors.grey,),
    );

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: useMobileLayout ? 2 : 3,
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
                  ScaleRoute(page: DetailsPage(dealId: data[index].dealId)));
            },
            child: Padding(
              padding: EdgeInsets.all(0.6 * SizeConfig.heightMultiplier),
              child: Card(
                shape: border,
                child: Column(children: <Widget>[
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(2 * SizeConfig.heightMultiplier),
                    child: Container(
                      child: Image.network(
                        data[index].image,
                        width: useMobileLayout && portrait
                            ? 17 * SizeConfig.widthMultiplier
                            : 14 * SizeConfig.widthMultiplier,
                        height: 15*SizeConfig.heightMultiplier,
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
                      data[index].detail,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 1.5 * SizeConfig.heightMultiplier),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Valid until : " + data[index].validDate),
                    ],
                  ),
                ]),
                color: offwhite,
              ),
            ),
          );
        },
        childCount: counter,
      ),
    );
  }
}