import 'package:dealshare/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Resource{

  final Status status;
  Resource({this.status});
}

enum Status {
  Success,
  Error,
  Cancelled
}


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


  //sign in with facebook
  Future signInWithFacebook() async {

    try {
      final LoginResult result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
          FacebookAuthProvider.credential(result.accessToken.token);
          final userCredential =
          await _firebaseAuth.signInWithCredential(facebookCredential);
          //print(userCredential);

          List userDetails = await DatabaseService().getUserDetails();

          if(userDetails[0]!=userCredential.user.displayName) {
            _setUserData(userCredential.user.displayName, 'gender', 'mobile', 'address', 'postcode', 'country');
          }

          return userCredential;
        case LoginStatus.cancelled:
          return null;
        case LoginStatus.failed:
          return null;
        default:
          return null;
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  //sign in google
Future signInWithGoogle() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    User user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    List userDetails = await DatabaseService().getUserDetails();

    if(userDetails[0]!=user.displayName) {
      _setUserData(user.displayName, 'gender', 'mobile', 'address', 'postcode', 'country');
    }

    return user;
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
      _setUserData(name,gender,mobile,address,postcode,country);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await FacebookAuth.instance.logOut();
        await FirebaseAuth.instance.signOut();
        await googleSignIn.signOut();
      }
      //await FirebaseAuth.instance.signOut();
      print("signedout");
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
