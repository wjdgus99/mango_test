import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart' as google;
import 'package:kakao_flutter_sdk/all.dart' as kakao;
import 'package:mango_test/model/exampleUser.dart';
import 'package:mango_test/model/users/user.dart' as localUser;
import 'package:mango_test/model/users/userRefrigerator.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'HHome.dart';
import 'InitInfo/initInfo.dart';
import 'app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'colors.dart';
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
          backgroundColor: Theme.of(context).accentColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 10,
                ),
                Container(
                  child: Text('당신의 냉장고를 관리해주는 집요정,',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: White)),
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
                  child: Text('Manager + 古',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: White)),
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
                  buttonColor: White,
                  child: RaisedButton.icon(
                    color: White,
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
                  buttonColor: White,
                  minWidth: 300,
                  height: 40,
                  child: RaisedButton.icon(
                    color: White,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () =>
                        _kakaoLogin(context, user, userRefrigerator),
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
                  buttonColor: White,
                  minWidth: 300,
                  height: 40,
                  child: RaisedButton.icon(
                    color: White,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () => Navigator.pushNamed(context, HOME),
                    // onPressed: () => Navigator.pushNamed(context, '/HHOME'),
                    icon: Icon(Icons.account_box),
                    label: Text(
                      '${userRefrigerator.RefrigeratorID}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                ),
                Spacer(
                  flex: 12,
                ),
                RaisedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/initInfo');
                  },
                  child: Text('정현이 바보'),
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

        print(userCredential.user);

        //mj: DB에 넣는 작업.
        var people = FirebaseFirestore.instance.collection('People');
        await FirebaseFirestore.instance.collection('People').doc(userCredential.user.uid)
        .get().then((DocumentSnapshot ds) async{
          if (!ds.exists){ //이전에 로그인이 없을 경우!
            await people.doc(userCredential.user.uid).set({
              'name': userCredential.user.displayName,
              'phone': userCredential.user.phoneNumber,
              'ref_id': 'ff000000', //TODO How to ref_id
            });
          }
        });
        LocalUser.UserID = userCredential.user.uid;

        var person = FirebaseFirestore.instance.collection('People');
        await person.doc(userCredential.user.uid).get().then((doc) {
          LocalUser.RefrigerID = doc.data()['ref_id'];
          LocalUser.Name = doc.data()['name'];
          LocalUser.PhoneNumber = doc.data()['phone'];
        });

        userRefrigerator.RefrigeratorID = LocalUser.RefrigerID;

        getRefrigeratorFromUser(userRefrigerator);

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

        getRefrigeratorFromUser(userRefrigerator);

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
    // IS - 보관방법 별 알림 주기.
    userRefrigerator.RefrigerationAlarm = 7;
    userRefrigerator.FrozenAlarm = 30;
    userRefrigerator.RoomTempAlarm = 3;

    // IS - 음식 리스트 불러오기.
    userRefrigerator.Foods.removeAt(0);
    userRefrigerator.AddFoodLists(sampleFoodList);

    userRefrigerator.RefrigerationFoods.removeAt(0);
    userRefrigerator.FrozenFoods.removeAt(0);
    userRefrigerator.RoomTempFoods.removeAt(0);
    userRefrigerator.RefrigerationFoods = userRefrigerator.Foods;
    userRefrigerator.FrozenFoods = userRefrigerator.Foods;
    userRefrigerator.RoomTempFoods = userRefrigerator.Foods;

    userRefrigerator.RegisterDateFoods.removeAt(0);
    userRefrigerator.RemainDateFoods.removeAt(0);
    userRefrigerator.RegisterDateFoods = userRefrigerator.Foods;
    userRefrigerator.RemainDateFoods = userRefrigerator.Foods;

    //IS - D-day 업데이트
    userRefrigerator.updateDuedate();
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
