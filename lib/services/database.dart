import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DatabaseService {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('UserData');

  Future <String> getUserDetails() async {

    final User user = auth.currentUser;
    final uid = user.uid;

    String name;
    await userCollection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {

        if(result.get('AuthUserId')==uid){
          name = result.get('Name');
          //print(name);
        }
      });
    });
    return name;
  }

}
