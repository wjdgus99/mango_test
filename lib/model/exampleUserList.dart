import 'user.dart';

class localUserList {
  //전체 USER

  static List<User> loadUserList() {
    List<User> Users = <User>[
      User(
        UserID: '00x000',
        RefrigerID: '01x000',
        Image: 'images/users/photo_mj.jpeg',
        Name: '민주',
        AlarmDueDate: 3,
        PhoneNumber: 12345678,
      ),
      User(
        UserID: '00x001',
        RefrigerID: '01x000',
        Image: 'images/users/photo_jh.jpeg',
        Name: '정현',
        AlarmDueDate: 1,
        PhoneNumber: 87654321,
      ),
      User(
        UserID: '00x010',
        RefrigerID: '01x000',
        Image: 'images/users/photo_is.jpeg',
        Name: '인석',
        AlarmDueDate: 5,
        PhoneNumber: 12341234,
      ),
    ];

    return Users;
  }
}
