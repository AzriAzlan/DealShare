import 'package:cloud_firestore/cloud_firestore.dart';
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
  List<String> dates;

  var counter = 0;

  void fetchData(){
    var now = new DateTime.now();

    FirebaseFirestore.instance
        .collection("Deals")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((DocumentSnapshot doc) {
        DealData deals = DealData.fromMap(doc.data());
        setState(() {
          var checkedDate = DateTime.parse(deals.validDate);
          if (checkedDate.compareTo(now)>0) {
            data.add(deals);
            counter = counter + 1;
          }
        });
      });
      print(counter);
    });
  }
  //
  Future<int> fetchShares(int did) async {
    var myDoc = await FirebaseFirestore.instance.collection('Referral').doc('Deal_$did').collection('List').get();
    return (myDoc.docs.length);
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
        ? 26 * SizeConfig.heightMultiplier
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