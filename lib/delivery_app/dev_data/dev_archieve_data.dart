import 'package:eltayar/core/class/crud.dart';
import 'package:eltayar/link_api.dart';

class DevArchieveData {
  Crud crud;

  DevArchieveData(this.crud);
  getData(String tayarid) async {
    var response =
        await crud.postData(AppLink.devViewRchieve, {"tayarid": tayarid});
    return response.fold((l) => l, (r) => r);
  }
}
