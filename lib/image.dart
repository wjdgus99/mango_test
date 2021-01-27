import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  @override
  _ImageState createState() => _ImageState();
}

class _ImageState extends State<PickImage> {
  bool uploaded = false;
  final picker = ImagePicker();
  File _image;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        uploaded = true;
        print('uploaded');
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          RaisedButton(
            child: Icon(Icons.add),
            onPressed: () => getImage(),
          ),
          Container(
            color: Colors.white,
            child: SizedBox(
                height: 300,
                child: uploaded
                    ? Image.file(_image)
                    : SizedBox(
                        height: 300,
                      )),
          )
        ]),
      ),
    );
  }
}
