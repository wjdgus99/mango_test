import './food.dart';

class UserRefrigerator {
  //기능1: User ID를 넣으면-> Refriger ID를 배출해낸다.
  //기능2: User ID를 넣으면 -> ReFriger 안에 있는 Food들을 볼 수 있다. (Master)
  String RefrigeratorID;
  List<StorageID> MyStorageID; //IS - [냉장실, 냉동실, 실온보관]

  UserRefrigerator(String refrigeratorID) {
    RefrigeratorID = refrigeratorID;
  }

  //TODO: IS - DB에 올릴 때는 Future로 바꿔야 할 듯.
  void AddProduct(List<Food> foods,List<int> ItemIndexes) {

  }
}

class StorageID {
  String AlarmDate;
  List<Food> food;
}
