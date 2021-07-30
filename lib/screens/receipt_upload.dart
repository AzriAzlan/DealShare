import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealshare/screens/home_screen.dart';
import 'package:dealshare/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddReceipt extends StatefulWidget {
  @override
  _AddReceiptState createState() => _AddReceiptState();
}

class _AddReceiptState extends State<AddReceipt> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final _picker = ImagePicker();
  PickedFile image;
  File imageFile;
  var storage = FirebaseStorage.instance;
  bool isLoading=false;

  _openGallery(BuildContext context) async {
    image = await _picker.getImage(source: ImageSource.gallery);
    imageFile = File(image.path);
    this.setState(() {});
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    image = await _picker.getImage(source: ImageSource.camera);
    imageFile = File(image.path);
    this.setState(() {});
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Import or take a photo"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future uploadImageToFirebase() async {
    final User user = auth.currentUser;
    final uid = user.uid;
    var imageName = DateTime.now().toString();
    try{
      TaskSnapshot snapshot = await storage
          .ref()
          .child("Receipts/$uid/$imageName")
          .putFile(imageFile);
      if (snapshot.state == TaskState.success) {
        final String downloadUrl =
        await snapshot.ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection("UserData")
            .doc("$uid")
            .collection("uploaded_receipts")
            .add({"url": downloadUrl, "name": imageName,});

      } else {
        print(
            'Error from image repo ${snapshot.state.toString()}');
        throw ('This file is not an image');
      }

    } catch(e) {
      setState(() {
        isLoading=false;
      });
      print(e);
    }
  }

  Widget _determineView() {
    if (image == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0,250,0,250),
        child: Column(children: <Widget>[

          Text("NO IMAGE SELECTED"),
          ElevatedButton(
              onPressed: () {
                _showChoiceDialog(context);
              },
              child: Text("Select Image")),
        ]),
      );
    } else {
      return Column(children: <Widget>[

        SizedBox(height:10),
        Image.file(imageFile, width: 400, height: 400),

        SizedBox(height:10),

        ElevatedButton(

          onPressed: () async{
            setState(() {
              isLoading=true;
            });
            await uploadImageToFirebase();
            setState(() {
              isLoading=false;
            });
            Navigator.push(context,
              MaterialPageRoute(builder: (context)=>ProfilePage()),
            );
          },

          child: Text("Add"),

        ),
      ]);
    }
  }


  @override
  Widget build(BuildContext context) {
    return isLoading? Scaffold(body: Center(child: CircularProgressIndicator())) :Scaffold(
      appBar: AppBar(
        title: Text('Upload Receipt'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _determineView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}