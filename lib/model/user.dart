class User {
  User({
    this.UserID,
    this.RefrigerID,
    this.Image,
    this.Name,
    this.AlarmDueDate,
    this.AlarmReigistDate,
    this.PhoneNumber,
  });

  String UserID; //유저 UID
  String RefrigerID; // 유저의 냉장고 ID
  String Image; //프로필사진
  String Name;
  int AlarmDueDate; //유통기한 알림 Date.
  int AlarmReigistDate; //IS-등록일 기준 지난 날 알림.
  int PhoneNumber;
  List<String> FriendsList; //IS-친구목록
}
