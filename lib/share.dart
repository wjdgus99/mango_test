import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mango_test/chatList.dart';
import 'package:mango_test/colors.dart';
import 'package:mango_test/friendList.dart';
import 'package:mango_test/history.dart';
import 'package:mango_test/model/exampleRefrigerator.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:search_widget/search_widget.dart';

import 'model/food.dart';

class Share extends StatefulWidget {
  @override
  _ShareState createState() => _ShareState();

  const Share({Key key}) : super(key: key);
}

class _ShareState extends State<Share> {
  bool none = false;

  var _searchview = new TextEditingController();
  bool _firstSearch = true;
  String _query = '';

  List<Food> _nebulae;
  List<Food> _filterList;

  List<Food> list = localRefrigerator.loadFood();

  void initState() {
    super.initState();
    _nebulae = List<Food>();
    _nebulae = localRefrigerator.loadFood();
  }

  _ShareState() {
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        setState(() {
          _firstSearch = true;
          _query = _searchview.text;
        });
      }
    });
  }

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
              icon: Icon(Icons.article_outlined),
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
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: 16),
                  _createSearchView(),
                  _firstSearch ? _createListView() : _performSearch()
                ],
              ),
            ),
    );
  }

  Widget _createSearchView() {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: TextField(
        controller: _searchview,
        decoration: InputDecoration(
          hintText: 'search',
          // hintStyle: TextStyle(color: Colors.grey[300]),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _createListView() {
    return Flexible(
        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
      return Card(
        color: Colors.white,
        elevation: 5.0,
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Text("${_nebulae[index]}"),
        ),
      );
    }));
  }

  Widget _performSearch() {
    _filterList = List<Food>();
    for (int i = 0; i < _nebulae.length; i++) {
      var item = _nebulae[i];

      if (item.name.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(item);
      }
    }
    return _createFilteredListView();
  }

  Widget _createFilteredListView() {
    return Flexible(
      child: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 5.0,
          child: Container(
            margin: EdgeInsets.all(15.0),
            // child: Text("${_filterList[index]}"),
          ),
        );
      }),
    );
  }
}
