import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart' as google;
import 'package:kakao_flutter_sdk/all.dart' as kakao;
import 'package:mango_test/model/exampleUser.dart';
import 'package:mango_test/model/user.dart' as localUser;
import 'package:mango_test/model/userRefrigerator.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'model/sampleData.dart';

FirebaseAuth auth = FirebaseAuth.instance;

// ignore: camel_case_types
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeviceWidth = MediaQuery.of(context).size.width;
    DeviceHeight = MediaQuery.of(context).size.height;

    return Consumer2<localUser.User, UserRefrigerator>(
        builder: (context, user, userRefrigerator, child) {
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
                      _googleLogin(context, user, userRefrigerator);
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
                    onPressed: () => _kakaoLogin(context, user),
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
                      '${userRefrigerator.RefrigeratorID}',
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
    });
  }

  Future<void> _googleLogin(BuildContext context, localUser.User LocalUser,
      UserRefrigerator userRefrigerator) async {
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

        LocalUser.UserID = userCredential.user.uid;

        // IS - TODO: 이 부분은 uid를 받아온 이후 DB에 접근해서 가져오자.
        LocalUser.Email = userCredential.user.email;
        LocalUser.Image = userCredential.user.photoURL;
        LocalUser.Name = userCredential.user.displayName;
        LocalUser.PhoneNumber = userCredential.user.phoneNumber;

        userRefrigerator.RefrigeratorID = LocalUser.RefrigerID;

        /* IS - TODO: Refrigerator.RefrigeratorID = LocalUser.RefrigeratorID;
          Get data from DB referenced by Refrigerator.RefrigeratorID
          Set data of Refrigerator Provider from DB
         */

        // Navigator.pushNamed(context, HOME);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _kakaoLogin(BuildContext context, localUser.User LocalUser,
      UserRefrigerator userRefrigerator) async {
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

        print(kakaoUser);

        LocalUser.UserID = kakaoUser.id.toString();

        // IS - TODO: 이 부분은 uid를 받아온 이후 DB에 접근해서 가져오자.
        LocalUser.Email = kakaoUser.kakaoAccount.email;
        LocalUser.Image = kakaoUser.properties['profile_image'];
        LocalUser.Name = kakaoUser.properties['nickname'];

        userRefrigerator.RefrigeratorID = LocalUser.RefrigerID;

        /* IS - TODO: Refrigerator.RefrigeratorID = LocalUser.RefrigeratorID;
          Get data from DB referenced by Refrigerator.RefrigeratorID
          Set data of Refrigerator Provider from DB
         */

        // Navigator.pushNamed(context, HOME);

        // parseEmailAuth(context, email);
      }
    } catch (e) {
      print(e);
    }
  }

  void getRefrigeratorFromUser(UserRefrigerator userRefrigerator) {
    userRefrigerator.Foods.removeAt(0);
    userRefrigerator.AddFoodLists(sampleFoodList);

    userRefrigerator.RefrigerationFoods.removeAt(0);
    userRefrigerator.FrozenFoods.removeAt(0);
    userRefrigerator.RoomTempFoods.removeAt(0);
    userRefrigerator.RefrigerationFoods = userRefrigerator.Foods;
    userRefrigerator.FrozenFoods = userRefrigerator.Foods;
    userRefrigerator.RoomTempFoods = userRefrigerator.Foods;
    // print('Store 0: ${userRefrigerator.RefrigerationFoods.length}');
    // print('Store 1: ${userRefrigerator.FrozenFoods.length}');
    // print('Store 2: ${userRefrigerator.RoomTempFoods.length}');

    userRefrigerator.RegisterDateFoods.removeAt(0);
    userRefrigerator.RemainDateFoods.removeAt(0);
    userRefrigerator.RegisterDateFoods = userRefrigerator.Foods;
    userRefrigerator.RemainDateFoods = userRefrigerator.Foods;
    // print('Store 0: ${userRefrigerator.RegisterDateFoods.length}');
    // print('Store 1: ${userRefrigerator.RemainDateFoods.length}');
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
