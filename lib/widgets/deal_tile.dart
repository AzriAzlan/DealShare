
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealshare/screens/details_screen.dart';
import 'package:dealshare/services/dealData.dart';
import 'package:dealshare/size_config.dart';
import 'package:dealshare/widgets/ScaleRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DealTile extends StatefulWidget {

  @override
  _DealTileState createState() => _DealTileState();
}

class _DealTileState extends State<DealTile> {

  bool isLoading=true;

  final border =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0));

  Color offwhite = Color(0xfff8f8ff);

  List<DealData> data = [];
  var counter = 0;

  Future<int> fetchShares(int did) async {
    var myDoc = await FirebaseFirestore.instance.collection('Referral').doc('Deal_$did').collection('List').get();
    return (myDoc.docs.length);
  }

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
          isLoading=false;
        });
      });
      print(counter);
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    var shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;
    var portrait = MediaQuery.of(context).orientation==Orientation.portrait;

    return data.length>0?Container(
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
                        ScaleRoute(page: DetailsPage(dealId: data[index].dealId)));
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
                          child: Image.network(
                            data[index].image,
                            width: useMobileLayout&&portrait?17 * SizeConfig.widthMultiplier:14* SizeConfig.widthMultiplier,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            FittedBox(child: FutureBuilder<int>(
                              future: fetchShares(data[index].dealId),
                              builder: (context,snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting: return new Text('Successful Shares: ...');
                                  default:
                                    if (snapshot.hasError)
                                      return new Text('');
                                    else
                                      return new Text('Successful Shares: ${snapshot.data}');
                                }
                              },
                            )

                            ),
                            // FittedBox(child: Text("45 Ratings")),
                          ],
                        ),
                        FittedBox(
                          child: Text(
                            data[index].detail,style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Valid till "),
                            Text(data[index].validDate),
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
        itemCount: counter,
        viewportFraction: 0.7,
        scale: 0.8,
        itemWidth: MediaQuery.of(context).size.width,
        layout: SwiperLayout.STACK,
      ),
    ): Scaffold(body: Center(child: CircularProgressIndicator()));

  }
}
