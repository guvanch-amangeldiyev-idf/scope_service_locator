import 'package:navigation_test/base/base_bloc.dart';
import 'package:navigation_test/screens/page4/page4.dart';

import 'home_bloc.dart';

abstract class HomeBlocPage3 extends BaseBloc {
  factory HomeBlocPage3() => _HomeBloc();

  void navigateToDetails();

  void incrementCounter();
}

class _HomeBloc extends BlocImpl implements HomeBlocPage3 {
  _HomeBloc();

  final _screenData = HomeDataPage3.init();

  @override
  void initState() {
    super.initState();
    updateData();
  }

  final bool _isLoading = false;

  @override
  void navigateToDetails() {
    appNavigator.push(FourPage.page());
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
