import 'package:flutter/material.dart';
import 'package:mango_test/colors.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../colors.dart';

class Analytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFDB7D),
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
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              '나의 영양 정보',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: Color(0xFF606060),
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: RadarChart(
                          ticksTextStyle:
                              TextStyle(fontSize: 5, color: Colors.grey),
                          featuresTextStyle: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(
                                  color: Color(0xFF777777), letterSpacing: 1),
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
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: CircleAvatar(
                                                backgroundColor: Orange500,
                                                radius: 5,
                                              ),
                                            ),
                                            Text(
                                              '나의 냉장고',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .overline,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: CircleAvatar(
                                                radius: 5,
                                                backgroundColor: TGreen500,
                                              ),
                                            ),
                                            Text(
                                              '권장 기준',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .overline,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  height: 45,
                                  width: 100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 12.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '1일 영양성분 기준치에 대한 비율 (%)',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      fontSize: 8.0,
                                      // fontWeight: FontWeight.w400,
                                      color: Color(0xFF929292),
                                    ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '성인 1명 2000 kcal 기준',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      fontSize: 8.0,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF929292),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
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
                            child: Text(
                              '식품군별 영양 균형',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: Color(0xFF606060),
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircularPercentIndicator(
                              radius: 100.0,
                              lineWidth: 12.0,
                              percent: 0.3,
                              center: Text('양호',
                                  style: TextStyle(
                                      fontFamily: 'IBMPlexSans',
                                      fontSize: 20.49,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF96B039))),
                              progressColor: Color(0xFF96B039),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularPercentIndicator(
                              radius: 100.0,
                              lineWidth: 12.0,
                              percent: 0.125,
                              center: Text(
                                '부족',
                                style: TextStyle(
                                    fontFamily: 'IBMPlexSans',
                                    fontSize: 20.49,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).errorColor),
                              ),
                              progressColor: Theme.of(context).errorColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularPercentIndicator(
                              radius: 100.0,
                              lineWidth: 12.0,
                              percent: 0.7,
                              center: Text(
                                '과다',
                                style: TextStyle(
                                  fontFamily: 'IBMPlexSans',
                                  fontSize: 20.49,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFFFCE48),
                                ),
                              ),
                              progressColor: Color(0xFFFFCE48),
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
                              center: Text(
                                '과다',
                                style: TextStyle(
                                  fontFamily: 'IBMPlexSans',
                                  fontSize: 20.49,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFFFCE48),
                                ),
                              ),
                              progressColor: Color(0xFFFFCE48),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularPercentIndicator(
                              radius: 100.0,
                              lineWidth: 12.0,
                              percent: 0.3,
                              center: Text('양호',
                                  style: TextStyle(
                                      fontFamily: 'IBMPlexSans',
                                      fontSize: 20.49,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF96B039))),
                              progressColor: Color(0xFF96B039),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularPercentIndicator(
                              radius: 100.0,
                              lineWidth: 12.0,
                              percent: 0.125,
                              center: Text(
                                '부족',
                                style: TextStyle(
                                    fontFamily: 'IBMPlexSans',
                                    fontSize: 20.49,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).errorColor),
                              ),
                              progressColor: Theme.of(context).errorColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              '주의 영양소 섭취 현황',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: Color(0xFF606060),
                                  ),
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 80,
                        child: Image(
                          image: AssetImage('images/logo.png'),
                        ),
                      ),
                      // Image(
                      //   image: AssetImage('images/영양요정.png'),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('나트륨, 탄수화물을 줄이는\n건강한 식습관을 가져보세요!'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '나트륨',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(
                                    color: Color(0xFF606060),
                                  ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearPercentIndicator(
                          width: 350.0,
                          lineHeight: 10.0,
                          percent: 0.5,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          progressColor: Theme.of(context).errorColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '당류',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(
                                    color: Color(0xFF606060),
                                  ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearPercentIndicator(
                          width: 350.0,
                          lineHeight: 10.0,
                          percent: 0.5,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          progressColor: Color(0xFFFFCE48),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '탄수화물',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(
                                    color: Color(0xFF606060),
                                  ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearPercentIndicator(
                          width: 350.0,
                          lineHeight: 10.0,
                          percent: 0.5,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          progressColor: Color(0xFF96B039),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
