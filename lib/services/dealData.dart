class DealData {
  String image;
  String detail;
  String validDate;
  String title;
  String promoCode;
  int dealId;

  DealData.fromMap(Map<String, dynamic> data) {
    image = data['Image'];
    detail = data['Detail'];
    validDate = data['ValidDate'];
    title = data['Title'];
    promoCode = data['PromoCode'];
    dealId = data['deal_id'];
  }
}