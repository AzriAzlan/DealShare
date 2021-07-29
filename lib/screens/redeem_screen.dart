import 'package:cool_alert/cool_alert.dart';
import 'package:dealshare/images.dart';
import 'package:dealshare/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dealshare/services/database.dart';


class Redeempage extends StatefulWidget {
  String points = "0";
  @override
  _RedeempageState createState() => _RedeempageState();
}

class _RedeempageState extends State<Redeempage> {


  DatabaseService db = new DatabaseService();

  void updatePointsRealTime() {
    db.retrievePoint().then((value) => setState(() {
      widget.points = value;
    }));
  }

  void displaySuccess() {
    CoolAlert.show(
        context: context,
        title: "",
        type: CoolAlertType.success,
        text: 'Redeemed Successful!',
        confirmBtnText: 'Okay',
        confirmBtnColor: Colors.green,
        cancelBtnTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        onConfirmBtnTap: () async {
          Navigator.pop(context);
        });
  }

  void displayFailed() {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "",
        text: 'Oops. It seems like you don\'t have enough points',
        confirmBtnText: 'Okay',
        confirmBtnColor: Colors.green,
        cancelBtnTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        onConfirmBtnTap: () async {
          Navigator.pop(context);
        });
  }


  void redeem() {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.confirm,
        title: 'Confirm redemption?',
        text: 'Your points will be deducted',
        confirmBtnText: 'Yes',
        cancelBtnText: 'Cancel',
        confirmBtnColor: Colors.green,
        cancelBtnTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        onConfirmBtnTap: ()async {
          int amount = 500;
          await db.deductPoints(amount);
          Navigator.pop(context);

        });
  }

  @override
  Widget build(BuildContext context) {

    updatePointsRealTime();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Redeem Points'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 2*SizeConfig.heightMultiplier,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Currently, you have',
                style: TextStyle(fontSize: 13),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: FractionalOffset(0.3, 0),
                    child: Text(
                      widget.points,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset(0.5, -0.2),
                    child: Image.network(
                      'https://i.gyazo.com/a5f39bfb70c6b7e840b0b167e415d7f0.png',
                      height: 80,
                      width: 80,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                  redeem();
              },
              child: Container(
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withAlpha(100), blurRadius: 10.0),
                    ]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(
                        Images.nikeLogo,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Buy 1 free 1!',
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Valid til 15/5/2021',
                            style:
                                const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      Text(
                        '-500',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                redeem();
              },
              child: Container(
                  height: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(100), blurRadius: 10.0),
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image.asset(
                          Images.touchGo,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Redeem RM5 touch n go',
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'valid till 21/5/2021',
                              style:
                                  const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Text(
                          '-500',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
            ),

            GestureDetector(
              onTap: () {
                redeem();
              },
              child: Container(
                  height: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(100), blurRadius: 10.0),
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image.asset(
                          Images.shopee,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Redeem RM5 shopee pay',
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Valid till 25/5/2021',
                              style:
                                  const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Text(
                          '-500',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
