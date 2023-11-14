import 'package:eltayar/core/class/crud.dart';
import 'package:eltayar/link_api.dart';

class DevdetailsData {
  Crud crud;

  DevdetailsData(this.crud);
  getData(String tayarid) async {
    var response =
        await crud.postData(AppLink.devOrderDetails, {"tayarid": tayarid});
    return response.fold((l) => l, (r) => r);
  }
}
