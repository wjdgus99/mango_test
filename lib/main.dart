import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'app.dart';

//import 'package:firebase_core/firebase_core.dart';

import 'app.dart';

List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  //await Firebase.initializeApp();
  runApp(MangoApp());
}
