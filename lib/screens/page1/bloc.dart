import 'package:navigation_test/base/base_bloc.dart';
import 'package:navigation_test/screens/page2/page2.dart';
import 'package:navigation_test/screens/page3/page3.dart';

import 'home_bloc.dart';

abstract class HomeBloc extends BaseBloc {
  factory HomeBloc() => _HomeBloc();

  void navigateToDetails();
  void navigateToSecond();
  void incrementCounter();
}

class _HomeBloc extends BlocImpl implements HomeBloc {
  _HomeBloc();

  final _screenData = HomeData.init();

  @override
  void initState() {
    super.initState();
    updateData();
  }

  final bool _isLoading = false;

  @override
  void navigateToDetails() {
    appNavigator.push(SecondPage.page());
  }

  @override
  void navigateToSecond() {
    appNavigator.push(ThridPage.page());
  }

  void updateData() {
    super.handleData(
      isLoading: _isLoading,
      data: _screenData.copy(),
    );
  }

  @override
  void incrementCounter() {
    _screenData.counter++;
    updateData();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
