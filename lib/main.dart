import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as fireStore;
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:mango_test/model/user.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'model/user.dart' as localUser;

import 'app.dart';

List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  KakaoContext.clientId = "b6d297fef62ea93f6eab9450cf52dbcd";
  cameras = await availableCameras();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => localUser.User())],
    child: MangoApp(),
  ));
}
