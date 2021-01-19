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
  bool IsBarcode = true;

  final CameraDescription camera = cameras.first;

  Future<void> _initializeControllerFuture;

  @override
  // ignore: missing_return
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = CameraController(camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment(0, 0.8),
                children: [
                  snapshot.connectionState == ConnectionState.done
                      ? CameraPreview(_controller)
                      : CircularProgressIndicator(),
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
