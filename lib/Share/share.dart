import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mango_test/Chat/chatList.dart';
import 'package:mango_test/Chat/chatRoom.dart';
import 'package:mango_test/colors.dart';
import 'package:mango_test/Friend/friendList.dart';
import 'package:mango_test/Share/history.dart';
import 'package:mango_test/model/exampleRefrigerator.dart';
import 'package:mango_test/model/users/food.dart';
import 'package:mango_test/test_model/exampleShareFood.dart';
import 'package:mango_test/test_model/storeFood.dart';
import '../app.dart';
import './search.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

class Share extends StatefulWidget {
  @override
  _ShareState createState() => _ShareState();

  const Share({Key key}) : super(key: key);
}

class _ShareState extends State<Share> {
  bool none = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.person),
          // onPressed: () => Navigator.pushNamed(context, FRIENDLIST),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => FriendList()));
          },
        ),
        title: Text('거래광장'),
        actions: [
          IconButton(
              icon: Icon(Icons.chat_bubble_outline_outlined),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ChatList()));
              }),
          IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => History()));
              })
        ],
      ),
      body: none
          ? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('images/logo.png'),
                    ),
                    Text(
                      '친구를 추가해서 \n거래를 시작해보세요',
                      textAlign: TextAlign.center,
                    ),
                  ]),
            )
          // : ListView(
          //     children: [
          // IconButton(
          //     icon: Icon(Icons.search),
          //     onPressed: () {
          //       showSearch(context: context, delegate: Search(list));
          //     }),
          : SizedBox.expand(
              child: SafeArea(
                minimum: EdgeInsets.all(0.1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SearchBar<StoreFood>(
                    placeHolder: ListView(
                      children: <Widget>[
                        buildCard('lemon', 'mj', 12, '과일/채소', 3,
                            DateTime(2021, DateTime.january, 9)),
                        buildCard('pepper', 'is', 32, '과일/채소', 1,
                            DateTime(2021, DateTime.august, 11)),
                        buildCard('paprika', 'jh', 60, '과일/채소', 3,
                            DateTime(2021, DateTime.january, 1)),
                        buildCard('cucumber', 'si', 70, '과일/채소', 5,
                            DateTime(2021, DateTime.february, 4)),
                        buildCard('apple', 'yg', 130, '과일/채소', 4,
                            DateTime(2021, DateTime.january, 20)),
                      ],
                    ),
                    onSearch: search,
                    minimumChars: 1,
                    onItemFound: (StoreFood food, int index) {
                      return food.name == ''
                          ? SizedBox()
                          : buildCard(food.name, food.owner, food.registTime,
                              food.category, food.num, food.shelfLife);
                      // : ListTile(
                      //     title: Text(food.name),
                      //     subtitle: Text(food.num.toString()),
                      //     trailing: Text(food.category),
                      //     // trailing: Text($search),
                      //   );
                    },
                  ),
                ),
              ),
            ),
    );
  }

  Widget buildCard(
      String food, String owner, int min, String text, int num, DateTime due) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Grey200, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('images/foods/$food.png'),
                      backgroundColor: Colors.grey[200],
                    ),
                    Positioned(
                      left: 50,
                      top: 50,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage('images/users/photo_$owner.jpeg'),
                        backgroundColor: Colors.white60,
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: (min < 60)
                        ? Text(
                            '$min분 전',
                            style:
                                Theme.of(context).textTheme.overline.copyWith(
                                      color: Color(0xFFBFBFBF),
                                    ),
                          )
                        : Text(
                            '${min ~/ 60}시간 전',
                            style: Theme.of(context)
                                .textTheme
                                .overline
                                .copyWith(color: Color(0xFFBFBFBF)),
                          ),
                  ),
                  Text(
                    food + '  $num개',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    '유통기한 ${due.year}.${due.month}.${due.day}',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Theme.of(context).errorColor),
                  ),
                  Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Color(0xFFBFBFBF)),
                  ),
                  Row(
                    children: [
                      RaisedButton(
                        color: Orange100,
                        child: Icon(Icons.call),
                        onPressed: () {
                          print('call');
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Grey200)),
                      ),
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Icon(Icons.send_rounded),
                        onPressed: () => showAlertDialog('치즈', 3, '2021.1.30'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Grey200)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void showAlertDialog(
    String foodName,
    int num,
    String dueDate,
  ) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '김세인님과의 채팅을 생성하시겠습니까?',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    '$foodName $num개, 유통기한 $dueDate',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: DeviceWidth * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                '취소',
                                style: Theme.of(context).textTheme.button,
                              ),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: DeviceHeight * 0.02,
                        ),
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/chatRoom');
                              },
                              child: Text(
                                '생성',
                                style: Theme.of(context).textTheme.button,
                              ),
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<List<StoreFood>> search(String search) async {
  await Future.delayed(Duration(seconds: 2));
  return List.generate(StoreFoodList.length, (int index) {
    print('hello' + search + '!');
    return StoreFoodList[index]
            .name
            .toLowerCase()
            .contains(search.toLowerCase())
        ? StoreFood(
            name: StoreFoodList[index].name,
            category: StoreFoodList[index].category,
            num: StoreFoodList[index].num,
            shelfLife: StoreFoodList[index].shelfLife,
            registTime: StoreFoodList[index].registTime,
            owner: StoreFoodList[index].owner)
        : StoreFood(
            name: '',
            category: '',
            num: 0,
            shelfLife: DateTime(0),
            owner: '',
            registTime: 0);
  });
}
