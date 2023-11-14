import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:eltayar/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;
import 'status_request.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var respons = await http.post(Uri.parse(linkurl), body: data);
        if (respons.statusCode == 200 || respons.statusCode == 201) {
          Map responseBody = jsonDecode(respons.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.severFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.severException);
    }
  }
}
