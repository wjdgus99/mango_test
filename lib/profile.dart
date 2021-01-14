import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          padding: EdgeInsets.all(DeviceWidth * 0.1),
          children: <Widget>[
            imageProfile(
                "https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99BC644E5B725CA734"),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 15), // 얘는, flexible 할 필요 X
              child: Text(
                "계정정보",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(DeviceWidth * 0.04),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(hintText: '이메일'),
                    ),
                    TextField(
                      controller: _nickNameController,
                      decoration: InputDecoration(hintText: '닉네임'),
                    ),
                    TextField(
                      controller: _nickNameController,
                      decoration: InputDecoration(hintText: '이름'),
                    ),
                  ],
                )),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "알림설정",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(DeviceWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(child: Text('유통기한 만료 알림')),
                        Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            }),
                      ],
                    ),
                    Divider(
                      height: 0.5,
                      color: Colors.black,
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
    return DropdownButton(
      isExpanded: true,
      value: dropdownValue,
      icon: Icon(
        Icons.arrow_drop_down,
        color: Theme.of(context).primaryColor,
        size: 30,
      ),
      elevation: 16,
      underline: Divider(
        height: 5,
        color: Colors.black,
      ),
      items: <DropdownMenuItem>[
        DropdownMenuItem(
          value: 'Option 1',
          child: Text('만료 2일전'),
        ),
        DropdownMenuItem(
          value: 'Option 2',
          child: Text('만료 3일전'),
        ),
        DropdownMenuItem(
          value: 'Option 3',
          child: Text('만료 5일전'),
        ),
        DropdownMenuItem(
          value: 'Option 4',
          child: Text('만료 7일전'),
        ),
      ],
      onChanged: (value) {
        setState(() {
          dropdownValue = value;
        });
      },
    );
  }
}

Widget imageProfile(String url) {
  return Center(
    child: Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(url),
        )
      ],
    ),
  );
}
