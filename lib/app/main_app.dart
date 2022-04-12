import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation_test/app/app_bloc.dart';
import 'package:navigation_test/app/app_data.dart';
import 'package:navigation_test/base/bloc_data.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  final _bloc = GetIt.I.get<AppBloc>();
  final _navigatorKey = GlobalKey<NavigatorState>();
  final globalRootNavKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _bloc.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalRootNavKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _home(),
    );
  }

  StreamBuilder _home() => StreamBuilder<BlocData>(
        stream: _bloc.dataStream,
        builder: (context, result) {
          final blocData = result.data;
          final appData = blocData?.data;
          if (appData is AppData) {
            return _content(context, blocData, appData);
          } else {
            return Container();
          }
        },
      );

  Navigator _content(
    BuildContext context,
    BlocData? blocData,
    AppData appData,
  ) =>
      Navigator(
        key: _navigatorKey,
        onPopPage: (route, result) {
          _bloc.handleRemoveRouteSettings(route.settings);
          return route.didPop(result);
        },
        pages: appData.pages.toList(),
      );
}
