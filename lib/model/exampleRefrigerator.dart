import 'users/food.dart';

class localRefrigerator {
  //한명의 Refrigerator (흐름: 전체 Refrigerator 목록 중, userID와 해당하는 refriID를가진 친구 COMECOME!)
  static String RefrigerID = '01x000';

  static String getRefigerID() {
    return RefrigerID;
  }

  static List<Food> loadFood() {
    List<Food> Foods = <Food>[
      Food(
        name: '레몬',
        DueDate: -1,
        num: 1,
        category: '과일/채소',
        // foodimg: 'images/foods/lemon.png',
        isSelected: false,
        selectedNum: 0,
      ),
      Food(
        name: '파프리카',
        DueDate: 1,
        num: 3,
        category: '과일/채소',
        // foodimg: 'images/foods/paprika.png',
        isSelected: false,
        selectedNum: 0,
      ),
      Food(
        name: '오이',
        DueDate: 7,
        num: 1,
        category: '과일/채소',
        // foodimg: 'images/foods/cucumber.png',
        isSelected: false,
        selectedNum: 0,
      ),
      Food(
        name: '고추',
        DueDate: 12,
        num: 2,
        category: '과일/채소',
        // foodimg: 'images/foods/pepper.png',
        isSelected: false,
        selectedNum: 0,
      ),
      Food(
        name: 'lemon',
        DueDate: 12,
        num: 2,
        category: '과일/채소',
        // foodimg: 'images/foods/pepper.png',
        isSelected: false,
        selectedNum: 0,
      ),
      Food(
        name: 'cucumber',
        DueDate: 12,
        num: 2,
        category: '과일/채소',
        // foodimg: 'images/foods/pepper.png',
        isSelected: false,
        selectedNum: 0,
      ),
      Food(
        name: 'paprika',
        DueDate: 12,
        num: 2,
        category: '과일/채소',
        // foodimg: 'images/foods/pepper.png',
        isSelected: false,
        selectedNum: 0,
      ),
      Food(
        name: 'pepper',
        DueDate: 12,
        num: 2,
        category: '과일/채소',
        // foodimg: 'images/foods/pepper.png',
        isSelected: false,
        selectedNum: 0,
      ),
    ];

    return Foods;
  }
}
