// IS - 카테고리를 파일로 따로 빼 놓으면 나중에 DB에 개별 사진이 쌓일 때를 고려햐여 이 폴더만 삭제하고 새로 업데이트하기 편함.
import 'users/food.dart';

String CallImage(Food food) {
  List<String> categories = [
    '과일',
    '정육/계란',
    '채소',
    '우유/유제품',
    '수산물',
    '곡물',
    '조미료/양념',
    '냉장/냉동식품',
    '베이커리',
    '김치/반찬',
    '라면/즉석식품',
    '물/커피/음료',
  ];
  List<String> imgSources = [
    'Fruits.png',
    'MeatEggs.png',
    'Vegetables.png',
    'MilkNDairyProducts.png',
    'AquaticProducts.png',
    'Grains.png',
    'Seasonings.png',
    'RefrigeratedFrozenFoods.png',
    'Bakery.png',
    'KimchiSideDishes.png',
    'RamenInstantFoods.png',
    'WaterCoffeDrinks.png'
  ];

  int idx = categories.indexOf(food.category);
  return imgSources[idx];
}
