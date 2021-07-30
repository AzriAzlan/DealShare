class ReceiptData {
  String title;
  String url;
  String dealId;
  String uploaded;

  ReceiptData.fromMap(Map<String, dynamic> data) {
    title = data['title'];
    uploaded = data['uploaded'];
    url = data['url'];
    dealId = data['dealId'];
  }
}