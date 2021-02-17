import 'package:flutter/cupertino.dart';
import 'package:mango_test/refrigerator.dart';

import 'food.dart';

class UserRefrigerator extends ChangeNotifier {
  String _RefrigeratorID;

  set RefrigeratorID(String RID) {
    _RefrigeratorID = RID;
    notifyListeners();
  }

  String get RefrigeratorID => _RefrigeratorID;

  List<Food> Foods = [Food()]; // IS - Food Lists.
  int RefrigerationAlarm; // IS - 냉장 알림 주기
  int FrozenAlarm; // IS - 냉동 알림 주기
  int RoomTempAlarm; // IS - 실온 알림 주기

  // IS - 한눈에 보기를 위한 리스트.
  List<Food> _RefrigerationFoods = [Food()];
  List<Food> _FrozenFoods = [Food()];
  List<Food> _RoomTempFoods = [Food()];

  // IS - 유통기한별 보기 리스트 (구매일 기준, 남은 유통기한 기준)
  List<Food> _RegisterDateFoods = [Food()];
  List<Food> _RemainDateFoods = [Food()];

  // TODO: IS - 혹시 아래 setter 코드가 안 먹으면, comment처리해 놓은 setter로 사용.
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

  // IS - Setter / Getter (한눈에 보기)
  set RefrigerationFoods(List<Food> foods) => _RefrigerationFoods.addAll(
      foods.where((element) => element.storeLevel == 0));
  set FrozenFoods(List<Food> foods) =>
      _FrozenFoods.addAll(foods.where((element) => element.storeLevel == 1));
  set RoomTempFoods(List<Food> foods) =>
      _RoomTempFoods.addAll(foods.where((element) => element.storeLevel == 2));

  List<Food> get RefrigerationFoods => _RefrigerationFoods;
  List<Food> get FrozenFoods => _FrozenFoods;
  List<Food> get RoomTempFoods => _RoomTempFoods;

  // IS - Setter / Getter (유통기한별 보기)
  set RegisterDateFoods(List<Food> foods) =>
      _RegisterDateFoods.addAll(foods.where((element) => element.isSelected));
  set RemainDateFoods(List<Food> foods) =>
      _RemainDateFoods.addAll(foods.where((element) => !element.isSelected));

  List<Food> get RegisterDateFoods => _RegisterDateFoods;
  List<Food> get RemainDateFoods => _RemainDateFoods;

  //TODO: IS - DB에 올릴 때는 Future로 바꿔야 할 듯(add, update, delete).
  // IS - 등록페이지에서 사용할 Function들(add, update, delete).

  void AddFoodLists(List<Food> foods) {
    for (int i = 0; i < foods.length; i++) {
      // foods[i].storeLevel == 0
      //     ? _RefrigerationFoods.add(foods[i])
      //     : foods[i].storeLevel == 1
      //         ? _FrozenFoods.add(foods[i])
      //         : _RoomTempFoods.add(foods[i]);
      // IS - DB에는 Foods만, 나머지는 받아와서 분류해주는 식으로. 리던던시 방지.
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

  // 등록일 기준 정렬.
  void SortByRegisterDate(List<Food> foods) =>
      foods.sort((pre, next) => pre.DueDate.compareTo(next.DueDate));

  //IS - days기준 작은 값들만 리스트로 뽑아옴.
  //IS - ex) 남은 유통기한 3일 이내 식품: SortByDuedate(RemainDateFoods(),3);
  void SortByDuedate(List<Food> foods, int days) {
    List<Food> result = foods.where((element) {
      element.DueDate = element.shelfLife.difference(DateTime.now()).inDays;
      return element.DueDate <= days;
    });

    return result.sort((pre, next) => pre.DueDate.compareTo(next.DueDate));
  }

  void SortByPurchaseDate(List<Food> foods, int days) {
    List<Food> result = foods.where((element) {
      element.DueDate = element.registerDate.difference(DateTime.now()).inDays;
      return element.DueDate <= days;
    });

    return result.sort((pre, next) => pre.DueDate.compareTo(next.DueDate));
  }

  // IS - TODO: LoadFoodsFromSnapshot, UpdateFoodsFromSnapshot, DeleteFoodsFromSnapshot. (Firebase)
  // IS - 원하는 리스트 불러오기 ( e.g. LostFoodList(RegisterDateFood()); )
  List<Food> LoadFoodList(List<Food> foods) => foods;

  void updateDuedate() {
    for (int i = 0; i < Foods.length; i++) {
      if (Foods[i].isSelected) {
        if (Foods[i].storeLevel == 0) {
          Foods[i].DueDate =
              Foods[i].registerDate.difference(DateTime.now()).inDays +
                  RefrigerationAlarm;
        } else if (Foods[i].storeLevel == 1) {
          Foods[i].DueDate =
              Foods[i].registerDate.difference(DateTime.now()).inDays +
                  FrozenAlarm;
        } else {
          Foods[i].DueDate =
              Foods[i].registerDate.difference(DateTime.now()).inDays +
                  RoomTempAlarm;
        }
      } else {
        Foods[i].DueDate = Foods[i].shelfLife.difference(DateTime.now()).inDays;
      }
      print(Foods[i].name);
      print(Foods[i].DueDate);
    }
  }
}
