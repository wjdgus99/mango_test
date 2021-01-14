import 'package:mango_test/model/nutrition/nutrient.dart';

class Food {
  String name; //제품명
  DateTime ShelfLife; //유통기한
  DateTime RegisterDate; //등록날짜
  int DueDate; //남은 기간

  Nutrient nutrition; //영양정보
  int num; //수량
  String category; //음식 종류
  String foodimg; //사진
  int storelevel; //보관장소


}
