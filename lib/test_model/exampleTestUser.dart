import 'testUser.dart';

class localTestUser {
  static TestUser loadUser() {
    return TestUser(
      UserID: '00x000',
      RefrigerID: '01x000',
      Image: 'images/users/photo_mj.jpeg',
      Name: '민주',
      PhoneNumber: 12345678,
    );
  }
}
