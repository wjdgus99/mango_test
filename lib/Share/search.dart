import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:mango_test/test_model/exampleShareFood.dart';
import 'package:mango_test/model/sampleData.dart';
import 'package:mango_test/model/users/food.dart';
// import 'package:mango_test/model/food.dart';

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
          child: SearchBar<Food>(
            onSearch: search,
            onItemFound: (Food food, int index) {
              return food.name == ''
                  ? SizedBox()
                  : ListTile(
                      title: Text(food.name),
                      subtitle: Text(food.num.toString()),
                      trailing: Text(food.category),
                      // trailing: Text($search),
                    );
            },
          ),
        ),
      ),
    );
  }
}

Future<List<Food>> search(String search) async {
  await Future.delayed(Duration(seconds: 2));
  return List.generate(StoreFoodList.length, (int index) {
    print('hello' + search + '!');
    return StoreFoodList[index]
            .name
            .toLowerCase()
            .contains(search.toLowerCase())
        ? Food(
            name: StoreFoodList[index].name,
            category: StoreFoodList[index].category,
            // category: search.toString(),
            num: StoreFoodList[index].num,
            shelfLife: StoreFoodList[index].shelfLife,
            DueDate: StoreFoodList[index].DueDate,
          )
        : Food(name: '');
  });
}
