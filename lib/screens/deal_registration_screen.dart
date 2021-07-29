import 'package:dealshare/screens/home_screen.dart';
import 'package:dealshare/size_config.dart';
import 'package:dealshare/widgets/deals.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:dealshare/services/dealData.dart';

var fileName = "";
String tagLine = "";
String country = "";
String postCode = "";
String address = "";
String dealName = "";
String promoCode = "";
String year = "";
String day = "";
String month = "";
String description = "";
var storage = FirebaseStorage.instance;
var counter = 0;

class DealRegistration extends StatefulWidget {
  static const routeName = '';
  @override
  _DealRegistration createState() => _DealRegistration();
}

class _DealRegistration extends State<DealRegistration> {
  File savedImage;
  File _imageFile;
  final _dealNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _postCodeController = TextEditingController();
  final _countryController = TextEditingController();
  final _tagLineController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dayController = TextEditingController();
  final _monthController = TextEditingController();
  final _yearController = TextEditingController();
  void savedImages(File image) {
    savedImage = image;
  }

  Future _openGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future uploadImageToFirebase(BuildContext context) async {
    tagLine = _tagLineController.text;
    country = _countryController.text;
    postCode = _postCodeController.text;
    address = _addressController.text;
    dealName = _dealNameController.text;
    day = _dayController.text;
    month = _monthController.text;
    year = _yearController.text;
    description = _descriptionController.text;

    fileName = basename(_imageFile.path);
    final destination = fileName;
    await uploadFile(destination, _imageFile, dealName, address, postCode, country,
        tagLine, promoCode, day, month, year, description);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    promoCode = getRandomString(6);
  }

  Future uploadFile(
      String destination,
      File file,
      String dealName,
      String address,
      String postCode,
      String country,
      String tagLine,
      String promoCode,
      String day,
      String month,
      String year,
      String description) async {
    TaskSnapshot snapshot =
    await storage.ref().child(destination).putFile(file);
    final String downloadUrl = await snapshot.ref.getDownloadURL();
    await FirebaseFirestore.instance
        .collection("Deals")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          counter = counter + 1;
        });
      });
    });
    Map<String, dynamic> data = {
      "Title": dealName,
      "Address": address,
      "PostCode": postCode,
      "Country": country,
      "Detail": tagLine,
      "Image": downloadUrl,
      "deal_id": counter + 1,
      "PromoCode": promoCode.toUpperCase(),
      "ValidDate": day + "/" + month + "/" + year,
      "Description": description
    };

    await FirebaseFirestore.instance.collection('Deals').add(data);
    return;
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);

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
                    //ImageInput(savedImages),

                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 27 * SizeConfig.widthMultiplier,
                            child: TextField(
                              controller: _dealNameController,
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
                      Text(
                        "Company",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: _addressController,
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
                        width: 13 * SizeConfig.widthMultiplier,
                        child: TextField(
                          controller: _postCodeController,
                          decoration: InputDecoration(
                            labelText: "Postcode",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 34 * SizeConfig.widthMultiplier,
                      child: TextField(
                        controller: _countryController,
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
                      Text(
                        "Thumbnail Image",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextButton(
                      child: Text('Pick Image'),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                        onSurface: Colors.grey,
                      ),
                      onPressed: _openGallery,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Row(
                    children: [
                      Text(
                        "Tag Line",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: _tagLineController,
                    decoration: InputDecoration(
                      labelText: "Enter your tag line here...",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "Promo Code : " + promoCode.toUpperCase(),
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Icon(Icons.list),
                      ),
                      Text(
                        "Description",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
                    height: 120,
                    child: TextFormField(
                      controller: _descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: "Enter description here",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Row(
                    children: [
                      Text(
                        "Valid Until",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SizedBox(
                        width: 70,
                        child: TextField(
                          controller: _dayController,
                          decoration: InputDecoration(
                            labelText: "Day",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SizedBox(
                        width: 70,
                        child: TextField(
                          controller: _monthController,
                          decoration: InputDecoration(
                            labelText: "Month",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SizedBox(
                        width: 120,
                        child: TextField(
                          controller: _yearController,
                          decoration: InputDecoration(
                            labelText: "Year",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextButton(
                    child: Text(
                      "Upload",
                      style: TextStyle(fontSize: 30),
                    ),
                    onPressed: () {
                      uploadImageToFirebase(context);
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