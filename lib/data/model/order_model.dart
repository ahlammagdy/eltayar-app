class OrdersModel {
  int? orderId;
  int? orderUserid;
  String? orderType;
  String? orderNote;
  double? addressLat;
  double? addressLng;
  String? addressDetails;
  String? orderStatus;
  String? orderDate;
  String? orderTayar;
  int? userId;
  String? userName;
  String? phone;
  String? userDate;
  String? password;
  String? userRole;

  OrdersModel(
      {this.orderId,
      this.orderUserid,
      this.orderType,
      this.orderNote,
      this.addressLat,
      this.addressLng,
      this.addressDetails,
      this.orderStatus,
      this.orderDate,
      this.orderTayar,
      this.userId,
      this.userName,
      this.phone,
      this.userDate,
      this.password,
      this.userRole});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserid = json['order_userid'];
    orderType = json['order_type'];
    orderNote = json['order_note'];
    addressLat = json['address_lat'];
    addressLng = json['address_lng'];
    addressDetails = json['address_details'];
    orderStatus = json['order_status'];
    orderDate = json['order_date'];
    orderTayar = json['order_tayar'];
    userId = json['user_id'];
    userName = json['user_name'];
    phone = json['phone'];
    userDate = json['user_date'];
    password = json['password'];
    userRole = json['user_role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['order_userid'] = orderUserid;
    data['order_type'] = orderType;
    data['order_note'] = orderNote;
    data['address_lat'] = addressLat;
    data['address_lng'] = addressLng;
    data['address_details'] = addressDetails;
    data['order_status'] = orderStatus;
    data['order_date'] = orderDate;
    data['order_tayar'] = orderTayar;
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['phone'] = phone;
    data['user_date'] = userDate;
    data['password'] = password;
    data['user_role'] = userRole;
    return data;
  }
}
