import 'package:eltayar/core/class/crud.dart';
import 'package:eltayar/link_api.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);
  postData(String phone, String password) async {
    var response = await crud.postData(AppLink.login, {
      "phone": phone,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
