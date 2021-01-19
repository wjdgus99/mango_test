import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'colors.dart';
import 'main.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController _controller;
  bool isReady = false;
  bool IsBarcode = true;

  Future<void> _initializeControllerFuture;

  @override
  // ignore: missing_return
  Future<void> initState() {
    // TODO: implement initState
    setupCameras();
    super.initState();
  }

  Future<void> setupCameras() async {
    try {
      _controller = CameraController(cameras[0], ResolutionPreset.medium);
      _initializeControllerFuture =
          await _controller.initialize().then((value) {
        if (!mounted) {
          return;
        } else {
          setState(() {
            isReady = true;
          });
        }
      });
    } on CameraException catch (_) {
      setState(() {
        isReady = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isReady && !_controller.value.isInitialized) {
      return CircularProgressIndicator();
    }
    return FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment(0, 0.8),
                children: [
                  CameraPreview(_controller),
                  Align(
                    alignment: Alignment(0.8, -0.6),
                    child: RaisedButton(
                      color: !IsBarcode ? Color(0xffF7C653) : Grey200,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {
                        setState(() {
                          if (IsBarcode) {
                            IsBarcode = false;
                          }
                        });
                      },
                      child: Text('영수증'),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.8, -0.8),
                    child: RaisedButton(
                      color: IsBarcode ? Color(0xffF7C653) : Grey200,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {
                        setState(() {
                          if (!IsBarcode) {
                            IsBarcode = true;
                          }
                        });
                      },
                      child: Text('바코드'),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.5),
                    child: Container(
                      padding: EdgeInsets.all(4.0),
                      color: Theme.of(context).colorScheme.primary,
                      child: Text(
                        '영수증 or 사진을 찍으세요.',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    foregroundColor: Colors.white,
                    onPressed: null,
                    child: Icon(Icons.panorama_fish_eye_outlined),
                  )
                ],
              ));
        });
  }
}
