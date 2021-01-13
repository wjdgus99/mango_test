import 'package:mango_test/main.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class mainBottomNavigationBar {
  var bottomNavigationBar = BottomAppBar(
    shape: CircularNotchedRectangle(),
    //example margin
    notchMargin: 8,
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      //TODO: mainAxisSize.min should be added in Column.
      Spacer(
        flex: 2,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: Icon(Icons.home), onPressed: null),
          Container(child: Text('Home')),
        ],
      ),
      Spacer(
        flex: 6,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: Icon(Icons.people), onPressed: null),
          Container(child: Text('Member')),
        ],
      ),
      Spacer(
        flex: 9,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: Icon(Icons.fact_check), onPressed: null),
          Container(child: Text('Nutrition')),
        ],
      ),
      Spacer(
        flex: 6,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: Icon(Icons.person), onPressed: null),
          Container(child: Text('Account')),
        ],
      ),
      Spacer(
        flex: 2,
      ),
    ]),
  );
  var FAB = FloatingActionButton(child: Icon(Icons.add), onPressed: () {});
  var FABLocation = FloatingActionButtonLocation.centerDocked;
}

Widget mainAppBar(String title) {
  return AppBar(
    // backgroundColor: mangoOrange500,
    automaticallyImplyLeading: false,
    titleSpacing: 40, //TODO: Maybe erase this.
    title: Text(title),
    actions: [IconButton(icon: Icon(Icons.share), onPressed: null)],
  );
}
