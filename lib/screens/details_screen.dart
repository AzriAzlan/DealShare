import 'package:dealshare/images.dart';
import 'package:dealshare/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:share_plus/share_plus.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop()),
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  Images.mcdetails,
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
                    width: 20*SizeConfig.widthMultiplier,
                  ),
                  FittedBox(
                      child: FittedBox(
                        child: Text(
                    "45 Ratings",style: TextStyle(fontSize: 1.6*SizeConfig.textMultiplier),
                  ),
                      )),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(0.8*SizeConfig.heightMultiplier),
            padding: EdgeInsets.all(0.8*SizeConfig.heightMultiplier),
            child: Text(
              'Fish Foldover Promo!',
              style: TextStyle(fontSize: 2.5*SizeConfig.textMultiplier,fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(4.2*SizeConfig.widthMultiplier, 0.4*SizeConfig.heightMultiplier, 4.2*SizeConfig.widthMultiplier, 0.4*SizeConfig.heightMultiplier),
            padding: EdgeInsets.fromLTRB(4.2*SizeConfig.widthMultiplier, 0.4*SizeConfig.heightMultiplier, 4.2*SizeConfig.widthMultiplier, 0.4*SizeConfig.heightMultiplier),
            child: Column(
              children: [
                Text(
                  'Get Your Buy 1 Free 1* Crispy Fish Foldover Promo At Any McDonald’s Malaysia Outlets From 18-23 May 2020!',
                  style: TextStyle(fontSize: 2*SizeConfig.textMultiplier),
                ),

                Text(
                  '\n• Offer is limited to single redemption per transaction \n• Show QR code while ordering \n• Valid in Malaysia only',
                  style: TextStyle(fontSize: 1.5*SizeConfig.textMultiplier),
                ),
              ],
            ),
          ),

          SizedBox(height: 1.6*SizeConfig.heightMultiplier),
          Text("Valid until 15/5/2021"),
          SizedBox(
            height: 1.6*SizeConfig.heightMultiplier,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                  },
                  child: Icon(Icons.bookmark_border_rounded,size: 4*SizeConfig.heightMultiplier,)),
              SizedBox(
                width: 7*SizeConfig.widthMultiplier,
              ),
              GestureDetector(
                  onTap: () {
                    Share.share('check out my website https://example.com');
                  },
                  child: Icon(Icons.share,size: 4*SizeConfig.heightMultiplier,)),
            ],
          ),
          SizedBox(
            height: 1.6*SizeConfig.heightMultiplier,
          ),
          SizedBox(
            width: 21*SizeConfig.widthMultiplier,
            height: 4.8*SizeConfig.heightMultiplier,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AssetGiffyDialog(
                          image: Image.asset(
                            Images.qrcode,
                          ),
                          title: Text(
                            'Promo Code: A77B7A',
                            style: TextStyle(
                                fontSize: 1.8*SizeConfig.textMultiplier, fontWeight: FontWeight.w600),
                          ),
                          description: Text(
                            'Valid until 15/5/2021. Present this screen to cashier to enjoy voucher.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 1.3*SizeConfig.textMultiplier,
                            ),
                          ),
                          entryAnimation: EntryAnimation.BOTTOM_RIGHT,
                          buttonOkColor: Colors.cyan,
                          onOkButtonPressed: () {
                            Navigator.pop(context);
                          },
                        ));
              },
              child: Text(
                'REDEEM',
                style: TextStyle(fontSize: 1.6*SizeConfig.textMultiplier),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
