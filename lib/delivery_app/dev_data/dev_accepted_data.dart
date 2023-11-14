import 'package:eltayar/core/class/crud.dart';
import 'package:eltayar/link_api.dart';

class DevAcceptedData {
  Crud crud;

  DevAcceptedData(this.crud);
  getData(String tayarid) async {
    var response =
        await crud.postData(AppLink.devAccepted, {"tayarid": tayarid});
    return response.fold((l) => l, (r) => r);
  }

  getDone(String userid, String orderid) async {
    var response = await crud
        .postData(AppLink.devOrderDone, {"userid": userid, "orderid": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
