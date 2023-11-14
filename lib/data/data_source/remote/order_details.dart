import 'package:eltayar/core/class/crud.dart';
import 'package:eltayar/link_api.dart';

class OrderDetailData {
  Crud crud;

  OrderDetailData(this.crud);
  getData(orderid) async {
    var response =
        await crud.postData(AppLink.ordersDetails, {'order_id': orderid});
    return response.fold((l) => l, (r) => r);
  }
}
