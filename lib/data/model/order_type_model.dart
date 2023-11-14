class OrderTypeModel {
  int? ordertypeId;
  String? ordertypeName;
  String? ordertypeNameAr;

  OrderTypeModel({this.ordertypeId, this.ordertypeName, this.ordertypeNameAr});

  OrderTypeModel.fromJson(Map<String, dynamic> json) {
    ordertypeId = json['ordertype_id'];
    ordertypeName = json['ordertype_name'];
    ordertypeNameAr = json['ordertype_name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ordertype_id'] = ordertypeId;
    data['ordertype_name'] = ordertypeName;
    data['ordertype_name_ar'] = ordertypeNameAr;
    return data;
  }
}
