import 'package:flutter/material.dart';
import 'package:navigation_test/app/main_app.dart';
import 'package:navigation_test/di/dep_injector.dart';

void main() async {
  await initInjector();
  runApp(const App());
}

Future<void> initInjector() async {
  initPresentationModule();
//! it is globaly not scope
}
