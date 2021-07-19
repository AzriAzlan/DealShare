import 'package:dealshare/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authenticate {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> _setUserData(String name,String gender,String mobile , String address , String postcode,String country) async {
    final database = FirebaseFirestore.instance;
    try {

      User _currentUser = _firebaseAuth.currentUser;
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
      database.collection('UserData').add(userData).catchError((e) {
        print(e);
      });
    } catch (e) {
      print(e);
    }
  }


  //sign in with email and password
  Future signInEmail(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmail(String email, String password,String name,String gender,String mobile , String address , String postcode,String country) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      //String name,String gender,String mobile , String address , String postcode,String country
      _setUserData(name,gender,mobile,address,postcode,country);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
