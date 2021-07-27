import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DatabaseService {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('UserData');

  Future <List> getUserDetails() async {

    final User user = auth.currentUser;
    final uid = user.uid;
    final creationTime=user.metadata.creationTime;
    String name;
    String photoURL = (user.photoURL != null  ? user.photoURL+"?type=large" :"https://www.nicepng.com/png/full/799-7998295_profile-placeholder-woman-720-profile-photo-placeholder-png.png");
    //print(photoURL+"?type=normal");
    await userCollection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {

        if(result.get('AuthUserId')==uid){
          name = result.get('Name');
          //print(name);
        }
      });
    });
    List userDetails = [name,creationTime,photoURL];
    return userDetails;
  }

}
