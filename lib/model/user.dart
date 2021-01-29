class User {
  User({
    this.UserID,
    this.RefrigerID,
    this.Image,
    this.Nickname,
    this.Name,
    this.AlarmDate,
    this.PhoneNumber,
  });

  String UserID; //유저 UID
  String RefrigerID; // 유저의 냉장고 ID
  String Image; //프로필사진
  String Nickname;
  String Name;
  int AlarmDate; //알림Date
  int PhoneNumber;
}
