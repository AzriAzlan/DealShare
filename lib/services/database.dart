import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('users');

  Future newUser(String name) async {
    return await userCollection.doc(uid).set({
      'name': name,
    });
  }

}
