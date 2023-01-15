import 'package:flutter_test/flutter_test.dart';
import 'package:wendreof_app/app/modules/splash/splash_repository.dart';
 
void main() {
  late SplashRepository repository;

  setUpAll(() {
    repository = SplashRepository();
  });
}