class FavouriteData {
  int dealId;

  FavouriteData.fromMap(Map<String, dynamic> data) {
    dealId = data['DealId'];
  }
}