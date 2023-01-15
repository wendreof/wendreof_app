// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashStore on SplashStoreBase, Store {
  late final _$valueAtom =
      Atom(name: 'SplashStoreBase.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$busyAtom = Atom(name: 'SplashStoreBase.busy', context: context);

  @override
  bool get busy {
    _$busyAtom.reportRead();
    return super.busy;
  }

  @override
  set busy(bool value) {
    _$busyAtom.reportWrite(value, super.busy, () {
      super.busy = value;
    });
  }

  late final _$hasConnectionAtom =
      Atom(name: 'SplashStoreBase.hasConnection', context: context);

  @override
  bool get hasConnection {
    _$hasConnectionAtom.reportRead();
    return super.hasConnection;
  }

  @override
  set hasConnection(bool value) {
    _$hasConnectionAtom.reportWrite(value, super.hasConnection, () {
      super.hasConnection = value;
    });
  }

  late final _$checkConnectionAsyncAction =
      AsyncAction('SplashStoreBase.checkConnection', context: context);

  @override
  Future<bool> checkConnection() {
    return _$checkConnectionAsyncAction.run(() => super.checkConnection());
  }

  @override
  String toString() {
    return '''
value: ${value},
busy: ${busy},
hasConnection: ${hasConnection}
    ''';
  }
}
