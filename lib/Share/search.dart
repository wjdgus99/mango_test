import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:mango_test/model/food.dart';

class FlappySearch extends StatefulWidget {
  @override
  _FlappySearchState createState() => _FlappySearchState();
}

class _FlappySearchState extends State<FlappySearch> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar(),
        ),
      ),
    );
  }
}

Future<List<Food>> search(String search) async {
  await Future.delayed(Duration(seconds: 2));
}
