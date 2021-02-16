import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:mango_test/model/user.dart' as localUser;
import 'package:mango_test/test_model/exampleTestUser.dart';
import 'package:mango_test/test_model/testUser.dart';
import 'package:provider/provider.dart';

import '../app.dart';
import '../colors.dart';
import 'myTradeList.dart';
import 'myProduct.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();

  const Profile({Key key}) : super(key: key);
}

class _ProfileState extends State<Profile> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();

  bool isSwitched = true;
  String dropdownValue = 'Option 1';

  bool uploaded = false;
  final picker = ImagePicker();
  File _image;

  TestUser _user = localTestUser.loadUser();

  @override
  void initState() {
    super.initState();
  }

  Widget dropDownMenu() {
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

  @override
  Widget build(BuildContext context) {
    // return Consumer<localUser.User>(builder: (context, user, child) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        // leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
        centerTitle: true,
        title: Text('마이페이지'),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: RaisedButton(
        //       color: Theme.of(context).accentColor,
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(30)),
        //       onPressed: () => print('Save Profile'),
        //       child: Text('저장'),
        //     ),
        //   )
        // ],
      ),
      body: ListView(
        // padding: EdgeInsets.all(DeviceWidth * 0.05),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SizedBox(width: 100, child: imageProfile(_user)),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _user.Name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          '#' + _user.UserID,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ]),
                )
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    ButtonTheme.fromButtonThemeData(
                      data: Theme.of(context).buttonTheme.copyWith(
                            minWidth: 70,
                            height: 70,
                          ),
                      child: FlatButton(
                        color: Colors.grey[100],
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MyTradeList()));
                        },
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.playlist_add_check,
                          size: 40,
                          color: Theme.of(context)
                              .buttonTheme
                              .colorScheme
                              .secondary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '거래 내역',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    ButtonTheme.fromButtonThemeData(
                      data: Theme.of(context).buttonTheme.copyWith(
                            minWidth: 70,
                            height: 70,
                          ),
                      child: FlatButton(
                        color: Colors.grey[100],
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MyProduct()));
                        },
                        shape: CircleBorder(),
                        child: Icon(Icons.person_outline_rounded,
                            size: 40,
                            color: Theme.of(context)
                                .buttonTheme
                                .colorScheme
                                .secondary),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        '나의 게시글',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 5,
            color: Colors.grey[200],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "계정정보",
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "알림설정",
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
    // });
  }

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

  Widget imageProfile(TestUser user) {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 45,
          //TODO: Need To change - get from storage.
          backgroundImage: AssetImage(
              /*user.Image*/
              // 'images/users.png'
              user.Image),
          backgroundColor: Colors.white,
        ),
        Positioned(
          top: 50,
          left: 70,
          child: Container(
            width: 30,
            height: 30,
            child: FloatingActionButton(
              onPressed: () => getImage(),
              child: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
