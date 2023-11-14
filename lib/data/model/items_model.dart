class ItemsModel {
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDescription;
  String? itemQuantity;
  int? itemActive;
  int? itemPrice;
  String? itemDate;
  int? itemCatId;
  int? categoryId;
  String? categoryName;
  String? categoryNameAr;
  String? categoryDate;
  int? catOrderId;
  int? ordertypeId;
  String? ordertypeName;
  String? ordertypeNameAr;

  ItemsModel(
      {this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDescription,
      this.itemQuantity,
      this.itemActive,
      this.itemPrice,
      this.itemDate,
      this.itemCatId,
      this.categoryId,
      this.categoryName,
      this.categoryNameAr,
      this.categoryDate,
      this.catOrderId,
      this.ordertypeId,
      this.ordertypeName,
      this.ordertypeNameAr});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDescription = json['item_description'];
    itemQuantity = json['item_quantity'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemDate = json['item_date'];
    itemCatId = json['item_cat_id'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryNameAr = json['category_name_ar'];
    categoryDate = json['category_date'];
    catOrderId = json['cat_order_id'];
    ordertypeId = json['ordertype_id'];
    ordertypeName = json['ordertype_name'];
    ordertypeNameAr = json['ordertype_name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_name_ar'] = itemNameAr;
    data['item_description'] = itemDescription;
    data['item_quantity'] = itemQuantity;
    data['item_active'] = itemActive;
    data['item_price'] = itemPrice;
    data['item_date'] = itemDate;
    data['item_cat_id'] = itemCatId;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_name_ar'] = categoryNameAr;
    data['category_date'] = categoryDate;
    data['cat_order_id'] = catOrderId;
    data['ordertype_id'] = ordertypeId;
    data['ordertype_name'] = ordertypeName;
    data['ordertype_name_ar'] = ordertypeNameAr;
    return data;
  }
}
