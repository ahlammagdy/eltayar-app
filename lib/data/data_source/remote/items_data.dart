import 'package:eltayar/core/class/crud.dart';
import 'package:eltayar/link_api.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.items, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
