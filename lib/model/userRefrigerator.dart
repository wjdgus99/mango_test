import './food.dart';

class UserRefrigerator { //기능1: User ID를 넣으면-> Refriger ID를 배출해낸다.
                         //기능2: User ID를 넣으면 -> ReFriger 안에 있는 Food들을 볼 수 있다. (Master)
  String UID;
  List<Food> food;

  UserRefrigerator(String uid) {
    UID = uid;
  }
}
