// IS - 카테고리를 파일로 따로 빼 놓으면 나중에 DB에 개별 사진이 쌓일 때를 고려햐여 이 폴더만 삭제하고 새로 업데이트하기 편함.
import 'users/food.dart';

var imageMatching = {
  '과일': 'Fruits.png',
  '정육/계란': 'MeatEggs.png',
  '채소': 'Vegetables.png',
  '우유/유제품': 'MilkNDairyProducts.png',
  '수산물': 'AquaticProducts.png',
  '곡물': 'Grains.png',
  '조미료/양념': 'Seasonings.png',
  '냉장/냉동식품': 'RefrigeratedFrozenFoods.png',
  '베이커리': 'Bakery.png',
  '김치/반찬': 'KimchiSideDishes.png',
  '라면/즉석식품': 'RamenInstantFoods.png',
  '물/커피/음료': 'WaterCoffeDrinks.png',
};

String CallImage(Food food) {
  return imageMatching[food.category];
}
