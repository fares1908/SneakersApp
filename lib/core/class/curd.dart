import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Curd {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    if (await checkInternet()) {
      http.Response response = await http.post(Uri.parse(linkUrl), body: data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Response Body: ${response.body}');
        Map responseBody = json.decode(response.body);
        print(responseBody);
        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
