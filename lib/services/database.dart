import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DatabaseService {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final String uid;
  DatabaseService({this.uid});


  Future<void> _setUserData(String name,String gender,String mobile , String address , String postcode,String country) async {
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
        'Generation':'0',
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
        print("Exist")
      } else {
        _setUserData(user.displayName, 'gender', 'mobile', 'address', 'postcode', 'country')
      }
    });

    final creationTime=user.metadata.creationTime;
    String name=user.displayName;
    String photoURL = (user.photoURL != null  ? user.photoURL+"?type=large" :"https://www.nicepng.com/png/full/799-7998295_profile-placeholder-woman-720-profile-photo-placeholder-png.png");
    //print(photoURL+"?type=normal");

    List userDetails = [name,creationTime,photoURL];
    return userDetails;
  }

  Future<void> gainPoints(String recipientId) async {

    final CollectionReference pointCollection = FirebaseFirestore.instance.collection('UserPoints');
    var query = pointCollection.doc(recipientId);

    int generation = 0;
    int plus = 0;
    int recipientPoints = 0;

    await query.get().then((value) {
      recipientPoints = int.parse(value['Points']);
      generation = int.parse(value['Generation']);
    });

    if (generation == 1) {
      plus = 5;
    }
    else if (generation == 2) {
      plus = 2;
    }
    else if (generation == 3) {
      plus = 1;
    }
    int balance = recipientPoints + plus;

    await query.update({"Points": balance.toString()});
  }

  Future<bool> deductPoints(num amount) async {

    final User user = auth.currentUser;
    final uid = user.uid;

    final CollectionReference pointCollection = FirebaseFirestore.instance.collection('UserPoints');
    var query = pointCollection.doc(uid);

    int currentPoints = 0;
    int generation = 0;
    await query.get().then((value) {
      currentPoints = int.parse(value['Points']);
      generation = int.parse(value['Generation']);
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

}
