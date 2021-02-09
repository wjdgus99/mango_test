import 'package:flutter/foundation.dart';

class User with ChangeNotifier {
  String _UserID; //유저 UID
  String _Email; // IS - User Email
  String _Image; //프로필사진
  String _Name;
  String _PhoneNumber;

  final String RefrigerID =
      '123'; // 유저의 냉장고 ID  IS - 일단 상수로 넣어놓음. > UUID를 조합해서 만들 예정.
  List<String> FriendList; //IS - 친구 목록 TODO: need to change
  List<String> SharedList; //IS - 내가 공유하고 있는 품목 목록 TODO: need to change
  List<String>
      TradeLog; // IS - 전체 거래 목록 TODO: redundancy of the data(내가 팔았던 목록도 포함시킬 지) vs. More operation. (포함 시키지 않고 연산으로 처리할 지)

  // IS - setter / getter
  set UserID(String uID) {
    _UserID = uID;
    notifyListeners();
  }

  String get UserID => (_UserID == null) ? '' : _UserID;

  set Email(String email) {
    _Email = email;
    notifyListeners();
  }

  String get Email => (_Email == null) ? '' : _Email;

  set Image(String image) {
    _Image = image;
    notifyListeners();
  }

  String get Image => (_Image == null) ? 'images/profile_image.png' : _Image;

  set Name(String name) {
    _Name = name;
    notifyListeners();
  }

  String get Name => (_Name == null) ? '' : _Name;

  set PhoneNumber(String phoneNumber) {
    _PhoneNumber = phoneNumber;
    notifyListeners();
  }

  String get PhoneNumber => (_PhoneNumber == null) ? '' : _PhoneNumber;
}
