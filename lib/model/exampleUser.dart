import 'user.dart';

class localUser{ //한명의 USER

  static User loadUser(){
      return User(
        UserID: '00x000',
        RefrigerID: '01x000',
        Image: 'images/users/photo_mj.jpeg',
        Nickname: 'mj',
        Name: '민주',
        AlarmDate: 3,
        PhoneNumber: 12345678,
      );
  }

}