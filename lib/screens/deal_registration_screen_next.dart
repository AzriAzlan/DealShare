import 'package:dealshare/screens/home_screen.dart';
import 'package:dealshare/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DealRegistration2 extends StatefulWidget {
  static const routeName = '';
  @override
  _DealRegistration2 createState() => _DealRegistration2();
}

class _DealRegistration2 extends State<DealRegistration2> {

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

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Icon(Icons.list),
                      ),

                      Text("Description", style: TextStyle(fontSize: 25),),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
                    height: 100,
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: "Enter description here",
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Icon(Icons.monetization_on),
                      ),

                      Text("Reward", style: TextStyle(fontSize: 25),),

                    ],
                  ),
                ),

                Row(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SizedBox(
                        width: 8*SizeConfig.widthMultiplier,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Unit",
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 40*SizeConfig.widthMultiplier,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Amount",
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
                        child: Icon(Icons.assistant_photo_sharp),
                      ),

                      Text("Country List", style: TextStyle(fontSize: 25),),

                    ],
                  ),
                ),

                // LIST OF COUNTRY
                SingleChildScrollView(
                  child: SizedBox(
                    height: 280,
                    child: Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Country Name",
                            ),
                          ),
                        ),

                        Row(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 20),
                              child: SizedBox(
                                width: 17*SizeConfig.widthMultiplier,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: "Start Date",
                                  ),
                                ),
                              ),
                            ),

                            Text("-", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),

                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 5.0),
                              child: SizedBox(
                                width: 17*SizeConfig.widthMultiplier,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: "End Date",
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: TextButton.icon(
                                onPressed: () {
                                  // Delete the country
                                },
                                icon: Icon(Icons.delete_outline_rounded),
                                label: Text(""),
                              ),
                            ),

                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextButton.icon(
                            onPressed: () {
                              // Add a new country
                            },
                            icon: Icon(Icons.add_circle_outline_outlined),
                            label: Text(""),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextButton(
                    child: Text(
                      "Save",
                      style: TextStyle(fontSize: 30),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
