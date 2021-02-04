import 'testUser.dart';

class localTestUserList {
  //전체 USER

  static List<TestUser> loadUserList() {
    List<TestUser> Users = <TestUser>[
      TestUser(
        UserID: '00x000',
        RefrigerID: '01x000',
        Image: 'images/users/photo_mj.jpeg',
        Name: '민주',
        PhoneNumber: 12345678,
      ),
      TestUser(
        UserID: '00x001',
        RefrigerID: '01x000',
        Image: 'images/users/photo_jh.jpeg',
        Name: '정현',
        PhoneNumber: 87654321,
      ),
      TestUser(
        UserID: '00x010',
        RefrigerID: '01x000',
        Image: 'images/users/photo_is.jpeg',
        Name: '인석',
        PhoneNumber: 12341234,
      ),
    ];

    return Users;
  }
}
