import 'package:flutter/cupertino.dart';
import 'package:mango_test/model/nutrition/nutrient.dart';

class Food {
//보관장소
  Food({
    this.name,
    // @required this.shelfLife,
    // @required this.RegisterDate,
    this.category,
    this.num,
    this.nutrition,
    this.isSelected,
    this.selectedNum,
    this.storeLevel,
    this.DueDate,
  });

  String name; //제품명
  String category; //음식 종류
  int num; //수량

  int storeLevel; // IS - 보관방법( 0 - 냉장 / 1 - 냉동 / 2 - 실온)
  DateTime shelfLife; //유통기한
  DateTime registerDate; //등록날짜
  DateTime purchaseDate; // IS - 구매일자.
  Nutrient nutrition; //영양정보
  bool isSelected; // IS - 구매일자 vs. 유통기한
  int selectedNum;
  int DueDate; // IS - 유통기한 남은 날짜 or 등록기준 지난 시간.
}
