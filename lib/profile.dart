import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'app.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool isSwitched = true;
  String dropdownValue = 'Option 1';

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

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundImage: uploaded
                ? Image.file(_image)
                : AssetImage('images/profile_image.png'),
            backgroundColor: Colors.white,
          ),
          Positioned(
            top: 25,
            right: 5,
            child: Container(
              width: 40,
              height: 40,
              child: FloatingActionButton(
                onPressed: () => getImage(),
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          padding: EdgeInsets.all(DeviceWidth * 0.1),
          children: <Widget>[
            imageProfile(),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 15), // 얘는, flexible 할 필요 X
              child: Text(
                "계정정보",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Theme.of(context).accentColor,
                    ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(DeviceWidth * 0.04),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: '이메일',
                          hintStyle: Theme.of(context).textTheme.headline5),
                    ),
                    TextField(
                      controller: _nickNameController,
                      decoration: InputDecoration(
                          hintText: '닉네임',
                          hintStyle: Theme.of(context).textTheme.headline5),
                    ),
                    TextField(
                      controller: _nickNameController,
                      decoration: InputDecoration(
                          hintText: '이름',
                          hintStyle: Theme.of(context).textTheme.headline5),
                    ),
                  ],
                )),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "알림설정",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Theme.of(context).accentColor,
                    ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(DeviceWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Text('유통기한 만료 알림',
                                style: Theme.of(context).textTheme.headline5)),
                        Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            }),
                      ],
                    ),
                    dropDownMenu(),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget dropDownMenu() {
    // return DropdownButtonFormField(
    //   isExpanded: true,
    //   value: dropdownValue,
    //   icon: Icon(
    //     Icons.arrow_drop_down,
    //     color: Theme.of(context).accentColor,
    //     size: 30,
    //   ),
    //   items: <DropdownMenuItem>[
    //     DropdownMenuItem(
    //       value: 'Option 1',
    //       child: Text('만료 2일전', style: Theme.of(context).textTheme.headline5),
    //     ),
    //     DropdownMenuItem(
    //       value: 'Option 2',
    //       child: Text('만료 3일전', style: Theme.of(context).textTheme.headline5),
    //     ),
    //     DropdownMenuItem(
    //       value: 'Option 3',
    //       child: Text('만료 5일전', style: Theme.of(context).textTheme.headline5),
    //     ),
    //     DropdownMenuItem(
    //       value: 'Option 4',
    //       child: Text('만료 7일전', style: Theme.of(context).textTheme.headline5),
    //     ),
    //   ],
    //   onChanged: (value) {
    //     setState(() {
    //       dropdownValue = value;
    //     });
    //   },
    // );
    return Container(
      height: 60,
      child: InputDecorator(
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            value: dropdownValue,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).accentColor,
              size: 30,
            ),
            // elevation: 16,
            // underline: DropdownButtonHideUnderline(child: Container()),
            items: <DropdownMenuItem>[
              DropdownMenuItem(
                value: 'Option 1',
                child: Text('만료 2일전',
                    style: Theme.of(context).textTheme.headline5),
              ),
              DropdownMenuItem(
                value: 'Option 2',
                child: Text('만료 3일전',
                    style: Theme.of(context).textTheme.headline5),
              ),
              DropdownMenuItem(
                value: 'Option 3',
                child: Text('만료 5일전',
                    style: Theme.of(context).textTheme.headline5),
              ),
              DropdownMenuItem(
                value: 'Option 4',
                child: Text('만료 7일전',
                    style: Theme.of(context).textTheme.headline5),
              ),
            ],
            onChanged: (value) {
              setState(() {
                dropdownValue = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
