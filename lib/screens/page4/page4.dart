import 'package:flutter/material.dart';
import 'package:navigation_test/app/app_page.dart';
import 'package:navigation_test/base/bloc_state.dart';
import 'package:navigation_test/navigator/base_arguments.dart';
import 'package:navigation_test/screens/page4/bloc.dart';

class FourPage extends StatefulWidget {
  static const routeName = '/FourthPage';
  const FourPage({
    Key? key,
  }) : super(key: key);
  //final String title;

  static AppPage page({BaseArguments? arguments}) => AppPage(
        key: const ValueKey(routeName),
        name: routeName,
        arguments: arguments,
        builder: (context) => const FourPage(),
      );

  @override
  State<FourPage> createState() => _FourPageState();
}

class _FourPageState extends BlocState<FourPage, HomeBlocPage4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bloc.navigateToDetails,
        backgroundColor: Colors.yellowAccent,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
