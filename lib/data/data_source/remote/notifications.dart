import 'package:eltayar/core/class/crud.dart';
import 'package:eltayar/link_api.dart';

class NotificationsData {
  Crud crud;

  NotificationsData(this.crud);
  getData(userid) async {
    var response =
        await crud.postData(AppLink.notifications, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
