import 'package:eltayar/core/class/crud.dart';
import 'package:eltayar/link_api.dart';

class WaitingOrderData {
  Crud crud;

  WaitingOrderData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.waitingOrders, {});
    return response.fold((l) => l, (r) => r);
  }
}
