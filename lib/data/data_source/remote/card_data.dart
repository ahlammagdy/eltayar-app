import 'package:eltayar/core/class/crud.dart';
import 'package:eltayar/link_api.dart';

class CardData {
  Crud crud;
  CardData(this.crud);
  addCard(String userid, String itemid) async {
    var response = await crud
        .postData(AppLink.addCard, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }

  deleteCard(String userid, String itemid) async {
    var response = await crud
        .postData(AppLink.deleteCard, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }

  getCountCard(String userid, String itemid) async {
    var response = await crud
        .postData(AppLink.cradCountItem, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }

  viewCard(String userid) async {
    var response = await crud.postData(AppLink.viewCard, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
