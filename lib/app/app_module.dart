import 'package:flutter_modular/flutter_modular.dart';
import 'package:wendreof_app/app/modules/splash/splash_module.dart';

import 'modules/home/home_module.dart';
import 'modules/splash/splash_repository.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
