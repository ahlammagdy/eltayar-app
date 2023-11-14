class CardModel {
  int? countitems;
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDescription;
  String? itemQuantity;
  int? itemActive;
  int? itemPrice;
  String? itemDate;
  int? itemCatId;
  int? cardId;
  int? cardUserid;
  int? cardItemid;

  CardModel(
      {this.countitems,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDescription,
      this.itemQuantity,
      this.itemActive,
      this.itemPrice,
      this.itemDate,
      this.itemCatId,
      this.cardId,
      this.cardUserid,
      this.cardItemid});

  CardModel.fromJson(Map<String, dynamic> json) {
    countitems = json['countitems'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDescription = json['item_description'];
    itemQuantity = json['item_quantity'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemDate = json['item_date'];
    itemCatId = json['item_cat_id'];
    cardId = json['card_id'];
    cardUserid = json['card_userid'];
    cardItemid = json['card_itemid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['countitems'] = countitems;
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_name_ar'] = itemNameAr;
    data['item_description'] = itemDescription;
    data['item_quantity'] = itemQuantity;
    data['item_active'] = itemActive;
    data['item_price'] = itemPrice;
    data['item_date'] = itemDate;
    data['item_cat_id'] = itemCatId;
    data['card_id'] = cardId;
    data['card_userid'] = cardUserid;
    data['card_itemid'] = cardItemid;
    return data;
  }
}
