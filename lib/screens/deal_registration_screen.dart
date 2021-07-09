import 'package:dealshare/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/image_input.dart';
import 'deal_registration_screen_next.dart';
import 'dart:io';

class DealRegistration extends StatefulWidget {
  static const routeName = '';
  @override
  _DealRegistration createState() => _DealRegistration();
}

class _DealRegistration extends State<DealRegistration> {
  File savedImage;

  void savedImages(File image) {
    savedImage = image;
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          centerTitle: true,
          title: Text("Deal Registration"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Row(
                  children: [

                    ImageInput(savedImages),

                    Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 27*SizeConfig.widthMultiplier,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "Deal Name",
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Icon(Icons.location_city),
                      ),

                      Text("Company", style: TextStyle(fontSize: 25),),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Address",
                    ),
                  ),
                ),

                Row(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SizedBox(
                        width: 13*SizeConfig.widthMultiplier,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Postcode",
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 34*SizeConfig.widthMultiplier,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Country",
                        ),
                      ),
                    ),

                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Icon(Icons.web),
                      ),

                      Text("Landing Page", style: TextStyle(fontSize: 25),),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "URL",
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Row(
                    children: [

                      Text("Tag Line", style: TextStyle(fontSize: 25),),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Enter your tag line here...",
                    ),
                  ),
                ),

                Row(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Promo code : ", style: TextStyle(fontSize: 20),),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextButton(
                        child: Text(
                          "Next",
                          style: TextStyle(fontSize: 30),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DealRegistration2()));
                        },
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
