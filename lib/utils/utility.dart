import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/home/HomeScreen.dart';

enum ImageSourceType { gallery, camera }

//get bool
Future<bool?> getBool(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return  prefs.getBool(key)?? false;
}

//save bool
Future saveBool(String key,bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}


//Facebook Login Process
void facebookSignInProcess(BuildContext context) async{
  try {
     FacebookAuth.instance.login(permissions: ["email","name"]).then((value) {
      print(value.toString());

      if(value.accessToken == null){
        Fluttertoast.showToast(
            msg: value.message.toString(),
            backgroundColor: Colors.blue,
            textColor: Colors.white);
      }else{
        AccessToken? accessToken = value.accessToken;
         FacebookAuth.instance.getUserData().then((value) => {
         Fluttertoast.showToast(
         msg:  value.values.single,
         backgroundColor: Colors.blue,
         textColor: Colors.white)

         }

       );
      }
    });
  } catch (e) {
    print(e.toString());
    Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.blue,
        textColor: Colors.white);
  }
}
//Google SignIn Process
void googleSignInProcess(BuildContext context) async{
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  String? token = googleAuth?.idToken;
  if(googleUser!=null){
    print(googleUser.email);
    Fluttertoast.showToast(
        msg: "Welcome ${googleUser.email}",
        backgroundColor: Colors.blue,
        textColor: Colors.white);

    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id,(Route<dynamic> route) => false);

  }else{
    print("Failed");
    Fluttertoast.showToast(
        msg: "Failed",
        backgroundColor: Colors.blue,
        textColor: Colors.white);
  }
}

Future<void> googleSignOut() async {
  GoogleSignIn _googleSignIn = GoogleSignIn();
   await _googleSignIn.signOut();
}

Future<void> facebookSignOut() async {
  await FacebookAuth.instance.logOut();
}