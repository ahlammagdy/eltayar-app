import 'package:eltayar/core/class/crud.dart';
import 'package:eltayar/link_api.dart';

class CategoriesData {
  Crud crud;

  CategoriesData(this.crud);
  getData(String id) async {
    var response =
        await crud.postData(AppLink.categories, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  searchCatData(String search) async {
    var response = await crud.postData(AppLink.catSearch, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
