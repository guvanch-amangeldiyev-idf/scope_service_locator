import 'package:flutter/material.dart';
import 'package:navigation_test/app/app_page.dart';
import 'package:navigation_test/base/bloc_state.dart';
import 'package:navigation_test/navigator/base_arguments.dart';
import 'package:navigation_test/screens/page1/bloc.dart';

const String tagValue = "cat";

class MyHomePage extends StatefulWidget {
  static const routrName = '/MyHomePage';
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();

  static AppPage page({BaseArguments? arguments}) => AppPage(
        key: const ValueKey(routrName),
        name: routrName,
        arguments: arguments,
        builder: (context) => const MyHomePage(),
      );
}

class _MyHomePageState extends BlocState<MyHomePage, HomeBloc> {
  //! if i want to use stateless?
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(tag: tagValue, child: Image.asset("assets/hamster.png"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => bloc.navigateToDetails()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
