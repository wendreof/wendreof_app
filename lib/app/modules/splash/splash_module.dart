import 'package:flutter_modular/flutter_modular.dart';
import 'package:wendreof_app/app/modules/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashPage()),
  ];
}
