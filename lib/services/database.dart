import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DatabaseService {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final String uid;
  List favourite;

  DatabaseService({this.uid});


  Future<void> setUserData(String name,String gender,String mobile , String address , String postcode,String country) async {
    final database = FirebaseFirestore.instance;
    try {

      User _currentUser = auth.currentUser;
      String authid =_currentUser.uid;
      String email = _currentUser.email;
      final Map<String, String> userData = {
        'AuthUserId':'$authid',
        'Name': '$name',
        'Gender': '$gender',
        'Mobile': '$mobile',
        'Email':'$email',
        'Address': '$address',
        'Postcode': '$postcode',
        'Country': '$country',
      };
      database.collection('UserData').doc('$authid').set(userData).catchError((e) {
        print(e);
      });
      final Map<String, String> pointData = {
        'Total':'0',
        'Points': '0',
      };
      database.collection('UserPoints').doc('$authid').set(pointData).catchError((e) {
        print(e);
      });

    } catch (e) {
      print(e);
    }
  }

  Future <List> getUserDetails() async {

    final User user = auth.currentUser;
    final uid = user.uid;

    final DocumentReference userCollection =
    FirebaseFirestore.instance.collection('UserData').doc('$uid');

    userCollection.get().then((doc) => {
      if(doc.exists){
        print("Exist"),
      } else {
        setUserData(user.displayName, 'gender', 'mobile', 'address', 'postcode', 'country'),
  }
    });

    String name=user.displayName;

    final creationTime=user.metadata.creationTime;
    String photoURL = (user.photoURL != null  ? user.photoURL+"?type=large" :"https://www.nicepng.com/png/full/799-7998295_profile-placeholder-woman-720-profile-photo-placeholder-png.png");
    //print(photoURL+"?type=normal");

    List userDetails = [name,creationTime,photoURL];
    return userDetails;
  }

  Future<void> gainPoints(String dealId, String recipientId) async {

    // 3 generations UID
    String gen1, gen2, gen3;
    // 3 generations Points
    int gen1points, gen2points, gen3points;
    int gen1total, gen2total, gen3total;

    // Checking if there's 1st generation
    final CollectionReference referralCollection = FirebaseFirestore.instance.collection('Referral').doc('Deal_' + dealId).collection('List');
    var refQuery = referralCollection.where('ReceiverUID', isEqualTo: recipientId);

    await refQuery.get().then((querySnapshot) {
      for (DocumentSnapshot result in querySnapshot.docs) {
        gen1 = result['ReferrerUID'];
      }
    });

    bool cheat = false;
    // Confirming if there's gen1
    if (gen1 != null) {
      gen2 = recipientId;
      gen3 = getUserId();
      // Confirming if the gen1 == gen3
      if (gen1 == gen3) {
        cheat = true;
        gen1 = null;
        gen2 = recipientId;
        gen3 = getUserId();
      }
    }
    else {
      gen1 = recipientId;
      gen2 = getUserId();
    }

    if (!cheat) {
      // Getting points for each generation + update points
      final CollectionReference pointCollection = FirebaseFirestore.instance.collection('UserPoints');
      var pointQuery;

      if (gen3 != null) {
        pointQuery = pointCollection.doc(gen3);
        await pointQuery.get().then((value) {
          gen3points = int.parse(value['Points']);
          gen3total = int.parse(value['Total']);

        });
        await pointQuery.update({
          "Points" : (gen3points + 1).toString(),
          "Total" : (gen3total + 1).toString()
        });
      }

      pointQuery = pointCollection.doc(gen2);
      await pointQuery.get().then((value) {
        gen2points = int.parse(value['Points']);
        gen2total = int.parse(value['Total']);
      });
      await pointQuery.update({
        "Points" : (gen2points + 2).toString(),
        "Total" : (gen2total + 2).toString()
      });

      pointQuery = pointCollection.doc(gen1);
      await pointQuery.get().then((value) {
        gen1points = int.parse(value['Points']);
        gen1total = int.parse(value['Total']);

      });
      await pointQuery.update({
        "Points" : (gen1points + 5).toString(),
        "Total" : (gen1total + 5).toString()
      });

      // Add referral data to firebase
      if (gen3 != null) {
        referralCollection.doc().set({
          "ReferrerUID" : gen2,
          "ReceiverUID" : gen3,
        });
      }
      else {
        referralCollection.doc().set({
          "ReferrerUID" : gen1,
          "ReceiverUID" : gen2,
        });
      }
    }
    else { // Omit 1st gen
      // Getting points for each generation + update points
      final CollectionReference pointCollection = FirebaseFirestore.instance.collection('UserPoints');
      var pointQuery;

      pointQuery = pointCollection.doc(gen3);
      await pointQuery.get().then((value) {
        gen3points = int.parse(value['Points']);
        gen3total = int.parse(value['Total']);

      });
      await pointQuery.update({
        "Points" : (gen3points + 1).toString(),
        "Total" : (gen3total + 1).toString()
      });

      pointQuery = pointCollection.doc(gen2);
      await pointQuery.get().then((value) {
        gen2points = int.parse(value['Points']);
        gen2total = int.parse(value['Total']);
      });
      await pointQuery.update({
        "Points" : (gen2points + 2).toString(),
        "Total" : (gen2total + 2).toString()
      });

      // Add referral data to firebase
      referralCollection.doc().set({
        "ReferrerUID" : gen2,
        "ReceiverUID" : gen3,
      });
    }

  }

  Future<bool> deductPoints(num amount) async {

    final User user = auth.currentUser;
    final uid = user.uid;

    final CollectionReference pointCollection = FirebaseFirestore.instance.collection('UserPoints');
    var query = pointCollection.doc(uid);

    int currentPoints = 0;
    await query.get().then((value) {
      currentPoints = int.parse(value['Points']);
    });

    int balance = currentPoints - amount;
    if (balance >= 0) {
      await query.update({"Points": balance.toString()});
      return true;
    }
    else {
      return false;
    }
  }

  Future<String> retrievePoint() async {

    final User user = auth.currentUser;
    final uid = user.uid;

    final CollectionReference pointCollection = FirebaseFirestore.instance.collection('UserPoints');
    var query = pointCollection.doc(uid);

    int currentPoints = 0;
    await query.get().then((value) {
      currentPoints = int.parse(value['Points']);
    });

    return currentPoints.toString();
  }

  Future<String> retrieveTotalPoint() async {

    final User user = auth.currentUser;
    final uid = user.uid;
    final CollectionReference pointCollection = FirebaseFirestore.instance.collection('UserPoints');
    var query = pointCollection.doc(uid);
    int totalPoints = 0;
    await query.get().then((value) {
      totalPoints = int.parse(value['Total']);
    });
    return totalPoints.toString();
  }

    String getUserId() {

    final User user = auth.currentUser;
    final uid = user.uid;

    return uid;
  }

  String getUserIdCheck() {
    return uid;
  }

  Future<bool> checkDealClaim(String dealId) async {
    final User user = auth.currentUser;
    final uid = user.uid;

    CollectionReference claimedDealCollection = FirebaseFirestore.instance.collection('UserData').doc(uid).collection('ClaimedDeals');
    var query = claimedDealCollection.doc(dealId);

    bool result = false;

    await query.get().then((value) {
      if (value.exists) {
        result = true;
      }
    }).catchError((error) => () {
      result = false;
    });

    return result;
  }

  Future<bool> claimDeal(String dealId) async {
    final User user = auth.currentUser;
    final uid = user.uid;

    CollectionReference claimedDealCollection = FirebaseFirestore.instance.collection('UserData').doc(uid).collection('ClaimedDeals');
    var query = claimedDealCollection.doc(dealId);

    await query.set({
      'Status': 'Claimed',
    }).catchError((error) => () {
      return false;
    });
    return true;
  }

  Future<bool> checkFav(int dealId) async{
    final User user = auth.currentUser;
    final uid = user.uid;
    var myDoc = await FirebaseFirestore.instance.collection('UserData')
        .doc('$uid')
        .collection("Favourite")
        .doc(dealId.toString())
        .get();
    if (myDoc == null || !myDoc.exists) {
      return false;
    } else {
      return true;
    }

  }

  Future<void> addFav(int dealId) async {
    final User user = auth.currentUser;
    final uid = user.uid;
    await FirebaseFirestore.instance
        .collection('UserData')
        .doc("$uid")
        .collection("Favourite")
        .doc(dealId.toString())
        .set({
      "DealId": dealId
    });
  }

  Future<List<int>> removeFav(int dealId) async {
    final User user = auth.currentUser;
    final uid = user.uid;
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc("$uid")
        .collection("Favourite")
        .doc(dealId.toString())
        .delete();
  }

  }
