import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wendreof_app/app/modules/splash/splash_module.dart';
 
void main() {

  setUpAll(() {
    initModule(SplashModule());
  });
}