import 'package:eltayar/core/class/crud.dart';
import 'package:eltayar/link_api.dart';

class SingUpData {
  Crud crud;

  SingUpData(this.crud);
  postData(
      String username, String phone, String password, String userrole) async {
    var response = await crud.postData(AppLink.singup, {
      "username": username,
      "phone": phone,
      "password": password,
      "user_role": userrole
    });
    return response.fold((l) => l, (r) => r);
  }
}
