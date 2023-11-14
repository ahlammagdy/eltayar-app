class CategoriesModel {
  int? categoryId;
  String? categoryName;
  String? categoryNameAr;
  String? categoryDate;
  int? catOrderId;
  int? ordertypeId;
  String? ordertypeName;
  String? ordertypeNameAr;

  CategoriesModel(
      {this.categoryId,
      this.categoryName,
      this.categoryNameAr,
      this.categoryDate,
      this.catOrderId,
      this.ordertypeId,
      this.ordertypeName,
      this.ordertypeNameAr});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
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
