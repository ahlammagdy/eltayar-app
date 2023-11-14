import 'package:eltayar/core/class/crud.dart';
import 'package:eltayar/link_api.dart';

class ArchieveOrderData {
  Crud crud;

  ArchieveOrderData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.archivedOrders, {});
    return response.fold((l) => l, (r) => r);
  }
}
