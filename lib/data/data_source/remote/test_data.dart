import 'package:eltayar/core/class/crud.dart';
import 'package:eltayar/link_api.dart';

class TestData {
  Crud crud;

  TestData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
