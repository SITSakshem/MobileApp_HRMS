import 'package:flutter/material.dart';


extension ExtendedNotifier on ValueNotifier<bool> {
  void go() => this.value = true;

  void stop() => this.value = false;

  void flip() => this.value = !this.value;
}

extension ExtendedTypedNotifier<T> on ValueNotifier<T> {
  void to(T t) => this.value = t;
}

String emptyValidator(context,String value) {
  return value.isEmpty ? 'Cannot be empty' : '';
}


