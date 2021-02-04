import 'package:flutter/foundation.dart';

class TestUser {
  TestUser(
      {this.UserID, this.RefrigerID, this.Image, this.Name, this.PhoneNumber});

  String UserID; //유저 UID
  String RefrigerID; // 유저의 냉장고 ID
  String Image; //프로필사진
  String Name;
  List<String> FriendList; //IS - 친구 목록 TODO: need to change
  List<String> SharedList; //IS - 내가 공유하고 있는 품목 목록 TODO: need to change
  int PhoneNumber;
}
