import 'package:mango_test/test_model/storeFood.dart';

import '../model/users/food.dart';

List<StoreFood> StoreFoodList = <StoreFood>[
  StoreFood(
      name: 'lemon',
      category: '과일/채소',
      num: 3,
      owner: 'mj',
      shelfLife: DateTime(2021, DateTime.january, 9),
      registTime: 12),
  StoreFood(
      name: 'pepper',
      category: '과일/채소',
      num: 5,
      owner: 'is',
      shelfLife: DateTime(2021, DateTime.august, 11),
      registTime: 32),
  StoreFood(
      name: 'paprika',
      category: '과일/채소',
      num: 2,
      owner: 'jh',
      shelfLife: DateTime(2021, DateTime.january, 1),
      registTime: 60),
  StoreFood(
      name: 'cucumber',
      category: '과일/채소',
      num: 2,
      owner: 'si',
      shelfLife: DateTime(2021, DateTime.february, 4),
      registTime: 70),
  StoreFood(
      name: 'apple',
      category: '과일/채소',
      num: 1,
      owner: 'yg',
      shelfLife: DateTime(2021, DateTime.january, 20),
      registTime: 130),
];
