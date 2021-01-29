import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart' as google;
import 'package:kakao_flutter_sdk/all.dart' as kakao;

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
                height: 40,
                buttonColor: Colors.white,
                child: RaisedButton.icon(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () async {
                    _googleLogin(context);
                  },
                  icon: Icon(
                    Icons.account_box,
                    size: 24,
                  ),
                  label: Text(
                    '구글계정으로 시작하기',
                    style: Theme.of(context).textTheme.subtitle2,
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
                height: 40,
                child: RaisedButton.icon(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () => _kakaoLogin(context),
                  icon: Icon(Icons.account_box),
                  label: Text(
                    '카카오계정으로 시작하기',
                    style: Theme.of(context).textTheme.subtitle2,
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
                height: 40,
                child: RaisedButton.icon(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () => Navigator.pushNamed(context, HOME),
                  icon: Icon(Icons.account_box),
                  label: Text(
                    '카카오 시작하기',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
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
        final google.GoogleSignInAccount googleUser =
            await google.GoogleSignIn().signIn();
        final google.GoogleSignInAuthentication googleAuth =
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

  Future<void> _kakaoLogin(BuildContext context) async {
    try {
      final installed = await kakao.isKakaoTalkInstalled();
      String authCode = installed
          ? await kakao.AuthCodeClient.instance.requestWithTalk()
          : await kakao.AuthCodeClient.instance.request();
      kakao.AccessTokenResponse token =
          await kakao.AuthApi.instance.issueAccessToken(authCode);
      kakao.AccessTokenStore.instance.toStore(token);

      if (token.refreshToken == null) {
        print('Error: login error..');
      } else {
        kakao.User kakaoUser = await kakao.UserApi.instance.me();

        String email = kakaoUser.kakaoAccount.email;

        Navigator.pushNamed(context, HOME);

        // parseEmailAuth(context, email);
      }
    } catch (e) {
      print(e);
    }
  }

  // Future<void> parseEmailAuth(BuildContext context, String email) async {
  //   var acs = ActionCodeSettings(
  //       url: 'https://kauth.kakao.com',
  //       androidPackageName: 'com.example.mango_test',
  //       androidInstallApp: true,
  //       handleCodeInApp: true);
  //
  //   auth
  //       .sendSignInLinkToEmail(email: email, actionCodeSettings: acs)
  //       .catchError(
  //           (onError) => print('Error: Sending Email verification $onError'))
  //       .then((value) {
  //     print('$value');
  //   });
  //
  // AuthCredential credential = EmailAuthProvider.credentialWithLink(
  //     email: email, emailLink: 'https://kauth.kakao.com');
  //
  // auth.currentUser
  //     .linkWithCredential(credential)
  //     .then((value) => Navigator.pushNamed(context, HOME));
  // }
}
