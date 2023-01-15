import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wendreof_app/app/utils/request.dart';

class SplashRepository extends Disposable {
  final request = Request();

  Future checkConnection() async {
    try {
      var response = await request.get("google.com/");
      print(response.data);
      return true;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
      return false;
    }
  }

  @override
  void dispose() {}
}
