import 'package:flutter/cupertino.dart';
import 'package:mango_test/model/nutrition/nutrient.dart';

class Food {
//보관장소
  Food({
    this.name,
    this.shelfLife,
    @required this.registerDate,
    this.purchaseDate,
    this.category,
    this.num,
    this.nutrition,
    this.isSelected,
    // this.selectedNum,
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
  int DueDate; // IS - 유통기한 남은 날짜 or 등록기준 지난 시간. TODO: 유통기한: ShelfLife - PurchaseDate / 등록일자: Now - PurchaseDate
  Nutrient nutrition; //영양정보
  bool isSelected; // IS - 구매일자 vs. 유통기한
  // int selectedNum;
}
