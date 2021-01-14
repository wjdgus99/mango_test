import 'package:flutter/material.dart';

import '../app.dart';

class AddProductDialog extends StatefulWidget {
  @override
  _AddProductDialogState createState() => _AddProductDialogState();
}

void showBottomPopup(context) {
  bool IsBarcode = true;

  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            alignment: WrapAlignment.center,
            // direction: Axis.vertical,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text('냉장고 채우기'),
                  ),
                  RaisedButton(
                    onPressed: () => print('insert'),
                    child: Text('직접입력'),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    25 / 361 * DeviceWidth, 0, 30 / 361 * DeviceWidth, 0),
                child: Text('식품의 바코드 또는 영수증을 촬영해주시면 자동으로 냉장고에 품목을 업로드 해드립니다.'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    color: IsBarcode ? Color(0xff78B437) : Color(0xff979797),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      // setState(() {
                      //   if (IsBarcode != true) {
                      //     IsBarcode = !IsBarcode;
                      //   }
                      // });
                    },
                    child: Text('바코드'),
                  ),
                  RaisedButton(
                    // color: !IsBarcode ? Color(0xff78B437) : Color(0xff979797),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      // setState(() {
                      //   if (IsBarcode != false) {
                      //     IsBarcode = !IsBarcode;
                      //   }
                      // });
                    },
                    child: Text('영수증'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonTheme(
                    child: RaisedButton(
                      onPressed: () => print('camera'),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Icon(Icons.photo_camera), Text('촬영하기')],
                      ),
                    ),
                  ),
                  ButtonTheme(
                    buttonColor: Theme.of(context).accentColor,
                    child: RaisedButton(
                      onPressed: () => print('album'),
                      child: Column(
                        children: [Icon(Icons.perm_media), Text('앨범에서 선택')],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    25 / 361 * DeviceWidth, 0, 30 / 361 * DeviceWidth, 0),
                child: RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        );
      });
}

// Container(
// child: Column(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// child: Text('냉장고 채우기'),
// ),
// RaisedButton(
// onPressed: () => print('insert'),
// child: Text('직접입력'),
// ),
// Container(
// child: Text(
// '식품의 바코드 또는 영수증을 촬영해주시면 자동으로 냉장고에 품목을 업로드 해드립니다.'),
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Spacer(),
// RaisedButton(
// color:
// IsBarcode ? Color(0xff78B437) : Color(0xff979797),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(30)),
// onPressed: () {
// setState(() {
// if (IsBarcode != true) {
// IsBarcode = !IsBarcode;
// }
// });
// },
// child: Text('바코드'),
// ),
// RaisedButton(
// // color: !IsBarcode ? Color(0xff78B437) : Color(0xff979797),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(30)),
// onPressed: () {
// setState(() {
// if (IsBarcode != false) {
// IsBarcode = !IsBarcode;
// }
// });
// },
// child: Text('영수증'),
// ),
// ],
// ),
// Row(
// children: [
// ButtonTheme(
// child: RaisedButton(
// onPressed: () => print('camera'),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Icon(Icons.photo_camera),
// Text('촬영하기')
// ],
// ),
// ),
// ),
// ButtonTheme(
// buttonColor: Theme.of(context).accentColor,
// child: RaisedButton(
// onPressed: () => print('album'),
// child: Column(
// children: [
// Icon(Icons.perm_media),
// Text('앨범에서 선택')
// ],
// ),
// ),
// ),
// ],
// ),
// Container(
// child: RaisedButton(
// onPressed: () => Navigator.pop(context),
// child: Text('Cancel'),
// ),
// ),
// ],
// ),
// ],
// ),
// )

class _AddProductDialogState extends State<AddProductDialog> {
  @override
  Widget build(BuildContext context) {
    bool IsBarcode = true;

    return SimpleDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text('냉장고 채우기'),
          ),
          RaisedButton(
            onPressed: () => print('insert'),
            child: Text('직접입력'),
          ),
        ],
      ),
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              25 / 361 * DeviceWidth, 0, 30 / 361 * DeviceWidth, 0),
          child: Text('식품의 바코드 또는 영수증을 촬영해주시면 자동으로 냉장고에 품목을 업로드 해드립니다.'),
        ),
        SizedBox(
          height: 30 * (DeviceHeight / 641),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            RaisedButton(
              color: IsBarcode ? Color(0xff78B437) : Color(0xff979797),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                setState(() {
                  if (IsBarcode != true) {
                    IsBarcode = !IsBarcode;
                  }
                });
              },
              child: Text('바코드'),
            ),
            Spacer(),
            RaisedButton(
              // color: !IsBarcode ? Color(0xff78B437) : Color(0xff979797),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                setState(() {
                  if (IsBarcode != false) {
                    IsBarcode = !IsBarcode;
                  }
                });
              },
              child: Text('영수증'),
            ),
            Spacer(),
          ],
        ),
        SizedBox(
          height: 20 * (DeviceHeight / 641),
        ),
        Row(
          children: [
            Spacer(
              flex: 2,
            ),
            ButtonTheme(
              height: 110 * (DeviceHeight / 641),
              minWidth: 110 * (DeviceWidth / 361),
              child: RaisedButton(
                onPressed: () => print('camera'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Icon(Icons.photo_camera), Text('촬영하기')],
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            ButtonTheme(
              buttonColor: Theme.of(context).accentColor,
              height: 110 * (DeviceHeight / 641),
              minWidth: 110 * (DeviceWidth / 361),
              child: RaisedButton(
                onPressed: () => print('album'),
                child: Column(
                  children: [Icon(Icons.perm_media), Text('앨범에서 선택')],
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
        SizedBox(
          height: 25 * (DeviceHeight / 641),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(
              25 / 361 * DeviceWidth, 0, 30 / 361 * DeviceWidth, 0),
          height: 35 * (DeviceHeight / 641),
          child: RaisedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
        ),
        SizedBox(
          height: 35 * (DeviceHeight / 641),
        ),
      ],
    );
  }
}
