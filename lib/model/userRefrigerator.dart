import 'package:mango_test/refrigerator.dart';

import './food.dart';

class UserRefrigerator {
  String _RefrigeratorID;
  String get RefrigeratorID => _RefrigeratorID;

  List<Food> Foods; // IS - Food Lists.
  List<int> StorageAlarm; // IS - [ 0 - 냉장 / 1 - 냉동 / 2 - 실온] 별 알람 일자.

  // IS - 한눈에 보기를 위한 데이터.
  List<Food> _RefrigerationFoods;
  List<Food> _FrozenFoods;
  List<Food> _RoomTempFoods;

  // TODO: IS - 혹시 아래 setter 코드가 안먹으면, comment처리해 놓은 setter로 사용.
  // set RefrigerationFoods(List<Food> foods) {
  //   List<Food> temp;
  //
  //   for (int i = 0; i < foods.length; i++) {
  //     if (foods[i].storeLevel == 0) {
  //       temp.add(foods[i]);
  //     }
  //   }
  //
  //   _RefrigerationFoods = temp;
  // }

  set RefrigerationFoods(List<Food> foods) =>
      _FrozenFoods.addAll(foods.where((element) => element.storeLevel == 1));
  set FrozenFoods(List<Food> foods) =>
      _FrozenFoods.addAll(foods.where((element) => element.storeLevel == 1));
  set RoomTempFoods(List<Food> foods) =>
      _RoomTempFoods.addAll(foods.where((element) => element.storeLevel == 2));

  //TODO: IS - DB에 올릴 때는 Future로 바꿔야 할 듯(add, update, delete).
  // IS - 등록페이지에서 사용할 Function들(add, update, delete).
  void AddFoodLists(List<Food> foods) {
    for (int i = 0; i < foods.length; i++) {
      foods[i].storeLevel == 0
          ? _RefrigerationFoods.add(foods[i])
          : foods[i].storeLevel == 1
              ? _FrozenFoods.add(foods[i])
              : _RoomTempFoods.add(foods[i]);
      Foods.add(foods[i]);
    }
  }

  void UpdateFoodLists(List<Food> foods) {
    for (int i = 0; i < foods.length; i++) {
      switch (foods[i].storeLevel) {
        case 0:
          _RefrigerationFoods.removeWhere(
              (element) => element.name == foods[i].name);
          _RefrigerationFoods.add(foods[i]);
          break;
        case 1:
          _FrozenFoods.removeWhere((element) => element.name == foods[i].name);
          _FrozenFoods.add(foods[i]);
          break;
        case 2:
          _RoomTempFoods.removeWhere(
              (element) => element.name == foods[i].name);
          _RoomTempFoods.add(foods[i]);
          break;
        default:
          break;
      }
      Foods.add(foods[i]);
    }
  }

  void DeleteFoodLists(List<Food> foods) {
    for (int i = 0; i < foods.length; i++) {
      foods[i].storeLevel == 0
          ? _RefrigerationFoods.add(foods[i])
          : foods[i].storeLevel == 1
              ? _FrozenFoods.add(foods[i])
              : _RoomTempFoods.add(foods[i]);
      Foods.remove(foods[i]);
    }
  }

  void SortByDuedate() {}
}
