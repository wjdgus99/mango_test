import 'package:flutter/material.dart';
import 'package:mango_test/app.dart';

class InitInfo extends StatefulWidget {
  @override
  _InitInfoState createState() => _InitInfoState();
}

class _InitInfoState extends State<InitInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: DeviceWidth * 0.04),
              child: Row(
                children: <Widget>[
                  Image(
                    image: AssetImage('images/logo.png'),
                    height: 70,
                    fit: BoxFit.contain,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('당신의 냉장고를 관리해주는 집요정,'),
                      Image.asset('images/appName_Black.png'),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: DeviceWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('냉장고 안의 식제품 알림을 설정해보세요.',style: Theme.of(context).textTheme.bodyText1,),
                  Text('유통기한 알림을 설정하면 냉장고 안의 음식들을 손쉽게 관리할 수 있습니다.',
                    style: Theme.of(context).textTheme.overline,)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: DeviceWidth * 0.07),
              child: Text('식제품 별 알림 설정',
                style: Theme.of(context).textTheme.subtitle1,),
            ),
            Container(
              height: DeviceHeight * 0.01,
              color: Color(0xFFE6E6E6),
            )
          ],
        ),
      ),
    );
  }
}
