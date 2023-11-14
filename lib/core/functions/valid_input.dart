import 'package:get/get.dart';

validInput(String val, int min, int max, String type, {pass}) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "invalid username";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "invalid email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "invalid phone number";
    }
  }

  if (type == "confirm") {
    if (!GetUtils.hasMatch(val, pass)) {
      return "match the password";
    }
  }

  if (val.isEmpty) {
    return "can't be empty";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }
}
