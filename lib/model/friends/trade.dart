import '../users/food.dart';

// IS - 거래하는 품목에 대한 클래스.
class trade {
  String TradeID; // IS - 거래식별번호 TODO: DocumentReference로 들어갈 예정.
  int _Number; // IS - 수량
  Food food;
  DateTime RegisterTradeDate; // IS - 거래등록 날짜(제품등록 날짜와 다름)
  String RegisterID; // IS - 등록한 사람(== UserID in user.dart)
  String message; // IS - 등록 메세지

  trade({
    this.food,
    this.TradeID,
  });

  set Number(int num) => _Number = num;
}

// IS - 거래 내역에 대한 카드.
class tradeLog extends trade {
  bool tradeStatus; // IS - 거래중, or 거래 완료. 이 값은 final 값으로 들어가야함.
  String ReceiverID; // IS - 물건을 받은 사람.
}
