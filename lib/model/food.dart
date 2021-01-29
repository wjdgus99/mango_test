import 'package:flutter/cupertino.dart';
import 'package:mango_test/model/nutrition/nutrient.dart';

class Food {
//보관장소
  Food(
      {this.foodID,
      this.name,
      this.DueDate,
      this.category,
      this.foodimg,
      this.storelevel,
      this.num,
      this.nutrition});

  String foodID;
  String name; //제품명
  String category; //음식 종류
  String foodimg; //사진
  int storelevel; //냉장(0), 냉동(1), 실온(2)
  int DueDate; //남은 기간
  int num; //수량
  DateTime shelfLife; //유통기한
  DateTime registerDate; //등록날짜
  Nutrient nutrition; //영양정보

}
