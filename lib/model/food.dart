import 'package:flutter/cupertino.dart';
import 'package:mango_test/model/nutrition/nutrient.dart';

class Food {
//보관장소
  Food({
    this.name,
    // @required this.shelfLife,
    // @required this.RegisterDate,
    this.DueDate,
    this.category,
    this.num,
    this.nutrition,
    this.isSelected,
    this.selectedNum,
    this.storeLevel,
  });

  String name; //제품명
  String category; //음식 종류
  int DueDate; //남은 기간
  int num; //수량
  int storeLevel; // IS - 보관방법( 0 - 냉장 / 1 - 냉동 / 2 - 실온)
  DateTime shelfLife; //유통기한
  DateTime registerDate; //등록날짜
  Nutrient nutrition; //영양정보
  bool isSelected; //거래품목에 선택되었는
  int selectedNum;
  int sortPoint; // IS - 유통기한, 등록일자 별 보여줄 표기 방식. -> getter / setter 도 만들어야함.
}
