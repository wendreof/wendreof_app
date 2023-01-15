import 'package:mobx/mobx.dart';
import 'package:wendreof_app/app/modules/splash/splash_repository.dart';

part 'splash_store.g.dart';

class SplashStore = SplashStoreBase with _$SplashStore;

abstract class SplashStoreBase with Store {
  late final SplashRepository _repository;

  @observable
  int value = 0;

  Future<void> increment() async {
    value = value + 1;
  }

  @observable
  bool busy = true;

  @observable
  bool hasConnection = false;

  @action
  Future<bool> checkConnection() async {
    busy = true;
    return await _repository.checkConnection().whenComplete(() => busy = false);
  }
}
