import 'package:eltayar/core/class/crud.dart';
import 'package:eltayar/link_api.dart';

class DevWaitingData {
  Crud crud;

  DevWaitingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.devViewWaiting, {});
    return response.fold((l) => l, (r) => r);
  }

  getApprovedData(
      String orderid, String userid, String tayarname, String tayarid) async {
    var response = await crud.postData(AppLink.devTakeOreder, {
      "orderid": orderid,
      "userid": userid,
      "tayarname": tayarname,
      "tayarid": tayarid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
