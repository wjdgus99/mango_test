import 'package:mango_test/model/user.dart' as localUser;

String UserID; //유저 UID
String RefrigerID; // 유저의 냉장고 ID
String Image; //프로필사진
String Name;
List<String> FriendList; //IS - 친구 목록
List<String> SharedList; //IS - 내가 공유하고 있는 품목 목록
List<String>
    TradeLog; // IS - 전체 거래 목록 TODO: redundancy of the data(내가 팔았던 목록도 포함시킬 지) vs. More operation. (포함 시키지 않고 연산으로 처리할 지)
int PhoneNumber;

// localUser.User user = localUser.User();
