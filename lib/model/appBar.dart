import 'package:flutter/material.dart';
import 'package:mango_test/app.dart';

import 'addProductDialog.dart';

Widget mainAppBar(String title) {
  return AppBar(
    leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
    titleSpacing: 40, //TODO: Maybe erase this.
    title: Text(title),
    actions: [IconButton(icon: Icon(Icons.share), onPressed: null)],
  );
}

//
// apps
Widget bottomNavigationBar(BuildContext context) {
  return BottomAppBar(
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
          IconButton(
              icon: Icon(Icons.fact_check),
              onPressed: () => Navigator.pushNamed(context, NUTRITION)),
          Container(child: Text('Nutrition')),
        ],
      ),
      Spacer(
        flex: 6,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () => Navigator.pushNamed(context, PROFILE)),
          Container(child: Text('Account')),
        ],
      ),
      Spacer(
        flex: 2,
      ),
    ]),
  );
}

Widget FAB(BuildContext context) {
  return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AddProductDialog();
          }));
}

final FABLocation = FloatingActionButtonLocation.centerDocked;
