import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as fireStore;
import 'package:flutter/material.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app.dart';

List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  runApp(MangoApp());
}
