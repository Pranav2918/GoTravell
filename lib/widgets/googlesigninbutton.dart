import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webdesign/services/auth.dart';
import 'package:flutter_webdesign/utils/responsive.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GSignin extends StatefulWidget {
  @override
  _GSigninState createState() => _GSigninState();
}

class _GSigninState extends State<GSignin> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleAuthProvider authProvider = GoogleAuthProvider();

  String? name;
  String? imageUrl;
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ResponsiveWidget.isSmallScreen(context)
            ? AuthService.signInWithGoogleMobile(context: context)
            : signInWithGoogle();
      },
      onHover: (val) {
        setState(() {
          isHovered = !isHovered;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: 40,
        width: 120,
        decoration: BoxDecoration(
            color: isHovered ? Colors.blue.withOpacity(0.2) : Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/google.png"),
              SizedBox(width: 5),
              Text("Sign In",
                  style: TextStyle(letterSpacing: 1.0, fontSize: 14))
            ],
          ),
        ),
      ),
    );
  }

  //Google Signin for Web
  signInWithGoogle() async {
    // Initialize Firebase
    await Firebase.initializeApp();
    User? user;

    // The 'GoogleAuthProvider' can only be used while running on the web
    GoogleAuthProvider authProvider = GoogleAuthProvider();

    try {
      final UserCredential userCredential =
          await _auth.signInWithPopup(authProvider);

      user = userCredential.user;
    } catch (e) {
      print(e);
    }

    if (user != null) {
      name = user.displayName;
      imageUrl = user.photoURL;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('auth', true);
      print(name);
    }

    return user;
  }
}
