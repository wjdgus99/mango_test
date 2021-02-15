import 'package:flutter/material.dart';
import 'package:mango_test/colors.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../colors.dart';

class Analytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Orange500,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.line_weight),
          ),
          title: Text('냉장고 분석'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.crop_square), onPressed: () => print('ref'))
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('나의 영양 정보'),
                        ),
                      ),
                    ),
                    Container(
                      child: RadarChart(
                        ticksTextStyle:
                            TextStyle(fontSize: 5, color: Colors.grey),
                        featuresTextStyle:
                            TextStyle(fontSize: 10, color: Colors.black),
                        graphColors: [TGreen500, Orange500],
                        ticks: [20, 40, 60, 80, 100],
                        features: [
                          '탄수화물',
                          '  칼로리 ',
                          '  콜레스테롤',
                          '나트륨',
                          '지방   ',
                          '단백질    '
                        ],
                        data: [
                          [62, 40, 78, 15, 6, 80],
                          [50, 40, 50, 50, 50, 50],
                        ],
                        // reverseAxis: true,
                      ),
                      width: 300,
                      height: 250,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('나의 냉장고')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.centerRight, child: Text('권장 기준')),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('식품군별 영양 균형'),
                        ),
                      ),
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularPercentIndicator(
                            radius: 100.0,
                            lineWidth: 12.0,
                            percent: 0.3,
                            center: Text('양호'),
                            progressColor: Colors.green,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularPercentIndicator(
                            radius: 100.0,
                            lineWidth: 12.0,
                            percent: 0.125,
                            center: Text('부족'),
                            progressColor: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularPercentIndicator(
                            radius: 100.0,
                            lineWidth: 12.0,
                            percent: 0.7,
                            center: Text('과다'),
                            progressColor: Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularPercentIndicator(
                            radius: 100.0,
                            lineWidth: 12.0,
                            percent: 0.7,
                            center: Text('과다'),
                            progressColor: Colors.yellow,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularPercentIndicator(
                            radius: 100.0,
                            lineWidth: 12.0,
                            percent: 0.3,
                            center: Text('양호'),
                            progressColor: Colors.green,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularPercentIndicator(
                            radius: 100.0,
                            lineWidth: 12.0,
                            percent: 0.125,
                            center: Text('부족'),
                            progressColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('주의 영양소 섭취 현황'),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 80,
                      child: Image(
                        image: AssetImage('images/logo.png'),
                      ),
                    ),
                    Image(
                      image: AssetImage('images/영양요정.png'),
                    ),
                    Text('나트륨, 탄수화물을 줄이는\n건강한 식습관을 가져보세요!'),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Align(
                          alignment: Alignment.centerLeft, child: Text('나트륨')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinearPercentIndicator(
                        width: 350.0,
                        lineHeight: 10.0,
                        percent: 0.5,
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        progressColor: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Align(
                          alignment: Alignment.centerLeft, child: Text('당류')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinearPercentIndicator(
                        width: 350.0,
                        lineHeight: 10.0,
                        percent: 0.5,
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        progressColor: Colors.yellow,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Align(
                          alignment: Alignment.centerLeft, child: Text('탄수화물')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinearPercentIndicator(
                        width: 350.0,
                        lineHeight: 10.0,
                        percent: 0.5,
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        progressColor: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
