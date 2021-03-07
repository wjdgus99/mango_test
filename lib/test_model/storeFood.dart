import 'package:flutter/cupertino.dart';

class StoreFood {
//보관장소
  StoreFood({
    @required this.name,
    @required this.category,
    @required this.num,
    @required this.owner,
    @required this.shelfLife,
    @required this.registTime,
    @required this.bodyText,
  });

  String name; //제품명
  String category; //음식 종류
  int num; //수량
  String owner; //올린사람
  DateTime shelfLife; //유통기한
  int registTime;  //게시글 등록 시간
  String bodyText;
}
