import 'package:mango_test/Friend/friendList.dart';
import 'package:mango_test/model/exampleUserList.dart';
import 'package:mango_test/test_model/exampleTestUserList.dart';

import 'testUser.dart';

class localTestUser {
  static TestUser loadUser() {
    return TestUser(
      UserID: '00x000',
      RefrigerID: '01x000',
      Image: 'images/users/photo_jh.jpeg',
      Name: '정현',
      PhoneNumber: 12345678,
      FriendList: localTestUserList.loadUserList(),
      SharedList: ['바나나', 'paprika'],
    );
  }
}
