import 'food.dart';

class localRefrigerator { //한명의 Refrigerator (흐름: 전체 Refrigerator 목록 중, userID와 해당하는 refriID를가진 친구 COMECOME!)
  static String RefrigerID = '01x000';

  static String getRefigerID(){
    return RefrigerID;
  }

  static List<Food> loadFood() {
    List<Food> Foods = <Food>[
      Food(
          foodID: '0000',
          name: '레몬',
          DueDate: -1,
          num: 1,
          category: '과일/채소',
          foodimg: 'images/foods/lemon.png',
          storelevel: 0),
      Food(
          foodID: '0001',
          name: '파프리카',
          DueDate: 1,
          num: 3,
          category: '과일/채소',
          foodimg: 'images/foods/paprika.png',
          storelevel: 0),
      Food(
          foodID: '0002',
          name: '오이',
          DueDate: 7,
          num: 1,
          category: '과일/채소',
          foodimg: 'images/foods/cucumber.png',
          storelevel: 1),
      Food(
          foodID: '0003',
          name: '고추',
          DueDate: 12,
          num: 2,
          category: '과일/채소',
          foodimg: 'images/foods/pepper.png',
          storelevel: 2),
    ];

    return Foods;
  }
}
