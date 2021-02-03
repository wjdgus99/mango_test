class RefryItem {
  RefryItem({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = true,
  });

  String expandedValue; //mj: 역할미정
  String headerValue; //mj: 냉장,냉동,실온
  bool isExpanded; //mj: Expanded 된지 안된지
}