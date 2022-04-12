import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation_test/app/app_page.dart';
import 'package:navigation_test/navigator/app_navigator.dart';
import 'package:navigation_test/navigator/base_arguments.dart';
import 'package:navigation_test/screens/page4/page4.dart';

class ThridPage extends StatelessWidget {
  static const routeName = '/ThirdPage';

  const ThridPage({Key? key}) : super(key: key);

  static AppPage page({BaseArguments? arguments}) => AppPage(
        key: const ValueKey(routeName),
        name: routeName,
        arguments: arguments,
        builder: (context) => const ThridPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("3 screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'dsdsds',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GetIt.I.get<AppNavigator>().push(FourPage.page()),
        tooltip: 'Increment',
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
