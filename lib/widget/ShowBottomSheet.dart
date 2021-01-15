import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../app.dart';
import '../colors.dart';
import '../direct_input.dart';
import '../home.dart';

class ShowBottomSheet extends StatefulWidget {
  @override
  _ShowBottomSheetState createState() => _ShowBottomSheetState();
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {
  bool IsBarcode = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 526 * (DeviceHeight / 812),
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(DeviceWidth * 0.03, 0, DeviceWidth * 0.03, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Container(
                    child: Text(
                      '품목 입력',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Spacer(
                    flex: 14,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      print('input');
                      showDirectInput(context);
                      print('output');
                    },
                    child: Text('직접입력'),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
              SizedBox(
                height: 10 * (DeviceHeight / 812),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    50 * (DeviceWidth / 812), 0, 50 * (DeviceWidth / 812), 0),
                child: Text(
                  '식품의 바코드 또는 영수증을 촬영해주시면,\n 자동으로 냉장고에 품목을 업로드 해드립니다.',
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 25 * (812 / DeviceHeight),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
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
                  RaisedButton(
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
                ],
              ),
              SizedBox(
                height: 40 * (DeviceHeight / 812),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonTheme(
                    buttonColor: Colors.white,
                    height: 150 * (DeviceHeight / 812),
                    minWidth: 150 * (375 / DeviceWidth),
                    child: RaisedButton(
                      onPressed: () => print('camera'),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Icon(Icons.photo_camera), Text('촬영하기')],
                      ),
                    ),
                  ),
                  ButtonTheme(
                    buttonColor: Colors.white,
                    height: 150 * (DeviceHeight / 812),
                    minWidth: 150 * (375 / DeviceWidth),
                    child: RaisedButton(
                      onPressed: () => print('album'),
                      child: Column(
                        children: [Icon(Icons.perm_media), Text('앨범에서 선택')],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30 * (375 / DeviceHeight),
              ),
              ButtonBar(
                buttonMinWidth: 334 / 375 * DeviceWidth,
                buttonHeight: 48,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('취소'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showDirectInput(context) {
    showBarModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return DirectInput();
        });
  }
}
