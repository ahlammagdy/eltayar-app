import 'package:eltayar/core/class/crud.dart';
import 'package:eltayar/link_api.dart';

class OrderData {
  Crud crud;

  OrderData(this.crud);
  addOrder(Map data) async {
    var response = await crud.postData(AppLink.orderAdd, data);
    return response.fold((l) => l, (r) => r);
  }
}
