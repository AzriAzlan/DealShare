import 'package:cool_alert/cool_alert.dart';
import 'package:dealshare/images.dart';
import 'package:dealshare/screens/home_screen.dart';
import 'package:dealshare/screens/profile_screen.dart';
import 'package:dealshare/screens/receipt_upload.dart';
import 'package:dealshare/services/dynamicLinkService.dart';
import 'package:dealshare/services/database.dart';
import 'package:dealshare/size_config.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:share_plus/share_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealshare/services/dealData.dart';

class SharedDetailsPage extends StatefulWidget {
  final int dealId;
  final String referrer;
  const SharedDetailsPage({Key key, this.dealId, this.referrer}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<SharedDetailsPage> {

  final DynamicLinkService _dynamicLinkService = DynamicLinkService();
  final DatabaseService db = new DatabaseService();
  String sharelink;

  void getShareLink() async {
    String referrer = await db.getUserId();
    await _dynamicLinkService.createShareLink(widget.dealId.toString(),referrer).then((value) => setState(() {
      sharelink = value;
    }));
  }

  List<DealData> data = [];
  var counter = 0;
  void fetchData() {
    FirebaseFirestore.instance
        .collection("Deals")
        .where('deal_id', isEqualTo: widget.dealId)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        DealData deals = DealData.fromMap(doc.data());
        setState(() {
          data.add(deals);
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var portrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return data.length>0? Scaffold(
      appBar: AppBar(
        title: Text(data[0].title),
        backgroundColor: Colors.cyan,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () =>
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              ),
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(1.5 * SizeConfig.heightMultiplier),
                    child: Container(
                      width: portrait
                          ? 85 *
                          SizeConfig
                              .widthMultiplier /*MediaQuery.of(context).size.width*/ : 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            2 * SizeConfig.heightMultiplier),
                        child: Image.network(
                          data[0].image,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.fiveStar,
                        width: 20 * SizeConfig.widthMultiplier,
                      ),
                      FittedBox(
                          child: FittedBox(
                            child: Text(
                              "45 Ratings",
                              style: TextStyle(
                                  fontSize: 1.6 * SizeConfig.textMultiplier),
                            ),
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 42 * SizeConfig.widthMultiplier,
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(0),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(
                                        color: Colors.black, width: 0.5))),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 2 * SizeConfig.heightMultiplier,
                              ),
                              SizedBox(
                                width: 2 * SizeConfig.widthMultiplier,
                              ),
                              FittedBox(
                                child: Text("Add to favourites"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    4.2 * SizeConfig.widthMultiplier,
                    0.4 * SizeConfig.heightMultiplier,
                    4.2 * SizeConfig.widthMultiplier,
                    0.4 * SizeConfig.heightMultiplier),
                padding: EdgeInsets.fromLTRB(
                    4.2 * SizeConfig.widthMultiplier,
                    0.4 * SizeConfig.heightMultiplier,
                    4.2 * SizeConfig.widthMultiplier,
                    0.4 * SizeConfig.heightMultiplier),
                child: Column(
                  children: [
                    Text(
                      data[0].description,
                      style: TextStyle(
                          fontSize: 2 * SizeConfig.heightMultiplier,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\n• Offer is limited to single redemption per transaction \n• Show QR code while ordering \n• Valid in Malaysia only',
                      style:
                      TextStyle(fontSize: 1.5 * SizeConfig.textMultiplier),
                    ),
                  ],
                ),
              ),
              //Text("ABC12345"),
              SizedBox(height: 1.6 * SizeConfig.heightMultiplier),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.remove_red_eye_outlined),
                  GestureDetector(
                    child: Text(" View Promo Code"),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => AssetGiffyDialog(
                            image: Image.asset(
                              Images.qrcode,
                            ),
                            title: Text(
                              'Promo Code: ' + data[0].promoCode,
                              style: TextStyle(
                                  fontSize: 1.8 * SizeConfig.textMultiplier,
                                  fontWeight: FontWeight.w600),
                            ),
                            description: Text(
                              'Valid until ' +
                                  data[0].validDate +
                                  ' Present this screen to cashier to enjoy voucher.Press Proceed only when voucher used.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 1.3 * SizeConfig.textMultiplier,
                              ),
                            ),
                            entryAnimation: EntryAnimation.BOTTOM_RIGHT,
                            buttonOkColor: Colors.cyan,
                            buttonOkText: Text("Proceed"),
                            onOkButtonPressed: () async {

                              bool result = await db.checkDealClaim(widget.dealId.toString());
                              if (result) {
                                // Already claim deal
                                // Output : Display the promo code normally
                              }
                              else {
                                // First time claim deal
                                bool claimResult = await db.claimDeal(widget.dealId.toString());
                                if (claimResult) {
                                  // Check if the referrer is the same as the current user
                                  String currentUserId = await db.getUserId();
                                  if (currentUserId == widget.referrer) {
                                    // The same person
                                    // No points will be rewarded
                                  }
                                  else {
                                    // Shared by other person or other account
                                    await db.gainPoints(widget.dealId.toString(), widget.referrer); // Give reward to the referrer
                                  }
                                }
                              }

                              CoolAlert.show(
                                  context: context,
                                  type: CoolAlertType.info,
                                  text: "You will now be redirected to upload your receipt!",
                                  onConfirmBtnTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(builder: (context) => AddReceipt(dealId: widget.dealId,dealTitle: data[0].title,)));
                                  }
                              );

                            },
                          ));
                    },
                  ),
                ],
              ),

              SizedBox(
                height: 1.6 * SizeConfig.heightMultiplier,
              ),

              Text("Valid until " + data[0].validDate),

              SizedBox(
                height: 1.6 * SizeConfig.heightMultiplier,
              ),
              SizedBox(
                width: 80 * SizeConfig.widthMultiplier,
                height: 6 * SizeConfig.heightMultiplier,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.cyan),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () async {
                    await getShareLink();
                    Share.share(sharelink);
                  },
                  child: Text(
                    'Share',
                    style: TextStyle(fontSize: 2 * SizeConfig.textMultiplier),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ): Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}