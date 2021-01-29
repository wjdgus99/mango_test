import './food.dart';

class UserRefrigerator {
  //기능1: User ID를 넣으면-> Refriger ID를 배출해낸다.
  //기능2: User ID를 넣으면 -> ReFriger 안에 있는 Food들을 볼 수 있다. (Master)
  String UID;
  Storage Refrigeration; //IS-냉장으로 보관될 음식통의 느낌
  Storage Freezing; //IS-냉동 보관용
  Storage RoomTemp; //IS-실온 보관용
  UserRefrigerator(String uid) {
    UID = uid;
  }
}

class Storage {
  List<Food> foods;
}
