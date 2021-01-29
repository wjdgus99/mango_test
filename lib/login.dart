import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

// ignore: camel_case_types
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeviceWidth = MediaQuery.of(context).size.width;
    DeviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color(0xffF7C653),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 10,
              ),
              Container(
                child: Text(
                  '당신의 냉장고를 관리해주는 집요정,',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                child: Image.asset('images/appName.png'),
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                child: Text(
                  'Manager + 古',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Image(
                image: AssetImage('images/logo.png'),
                height: 140,
                fit: BoxFit.contain,
              ),
              Spacer(
                flex: 6,
              ),
              ButtonTheme(
                minWidth: 300,
                height: 70,
                buttonColor: Colors.white,
                child: RaisedButton.icon(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () async {
                    _googleLogin(context);
                  },
                  icon: Icon(
                    Icons.account_box,
                    size: 24,
                  ),
                  label: Text(
                    '구글로 시작하기',
                    style: TextStyle(
                        color: Color.fromRGBO(53, 53, 53, 1), fontSize: 16),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              //same as above button.
              ButtonTheme(
                buttonColor: Colors.white,
                minWidth: 300,
                height: 70,
                child: RaisedButton.icon(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () => Navigator.pushNamed(context, HOME),
                  icon: Icon(Icons.account_box),
                  label: Text('카카오 시작하기'),
                ),
              ),
              Spacer(
                flex: 12,
              )
            ],
          ),
        ));
  }

  Future<void> _googleLogin(context) async {
    try {
      UserCredential userCredential;
      if (kIsWeb) {
        GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
        userCredential = await auth.signInWithPopup(googleAuthProvider);
      } else {
        final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        final GoogleAuthCredential googleAuthCredential =
        GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        userCredential = await auth.signInWithCredential(googleAuthCredential);
        Navigator.pushNamed(context, HOME);
      }
    } catch (e) {
      print(e);
    }
  }
}