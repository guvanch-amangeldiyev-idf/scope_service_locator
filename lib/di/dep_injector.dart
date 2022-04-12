import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:navigation_test/app/app_bloc.dart';
import 'package:navigation_test/navigator/app_navigator.dart';
import 'package:navigation_test/screens/page1/bloc.dart';
import 'package:navigation_test/screens/page4/bloc.dart';
import 'package:navigation_test/screens/page5/bloc.dart';

void initPresentationModule() {
  _initNavigationModule();
  _initAppModule();
  _initHomeBloc();
  _homePageFour();
  _homePageFive();
}

final sl = GetIt.I;

void _initNavigationModule() {
  sl.registerSingleton<AppNavigator>(AppNavigatorImpl());
}

void _initAppModule() {
  sl.registerFactory<AppBloc>(
    () => AppBloc(),
  );
}

void _initHomeBloc() {
  sl.registerFactory<HomeBloc>(() => HomeBloc());
}

//*********************************************************************************//

void _init4(GetIt sl) {
  sl.registerFactory<HomeBlocPage4>(() => HomeBlocPage4());
}

void _init5(GetIt sl) {
  sl.registerFactory<HomeBlocPage5>(() => HomeBlocPage5());
}

//*********************************************************************************//

void _remove() {
  sl.popScope();
  log("disposed");
  //sl.popScopesTill("page4");
  //sl.unregister();
}

//*********************************************************************************//

void _homePageFour() {
  sl.pushNewScope(scopeName: "page4", init: _init4, dispose: _remove);
  log("added");
}

void _homePageFive() {
  sl.pushNewScope(scopeName: "page5", init: _init5, dispose: _remove);
}
//*********************************************************************************//
