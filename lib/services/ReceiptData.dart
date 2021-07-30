class ReceiptData {
  String title;
  String url;
  String dealId;
  DateTime date;

  ReceiptData.fromMap(Map<String, dynamic> data) {
    title = data['title'];
    date = data['uploaded'];
    url = data['url'];
    dealId = data['dealId'];
  }
}