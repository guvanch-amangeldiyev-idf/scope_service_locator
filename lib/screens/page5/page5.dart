import 'package:flutter/material.dart';
import 'package:navigation_test/app/app_page.dart';
import 'package:navigation_test/base/bloc_data.dart';
import 'package:navigation_test/base/bloc_state.dart';
import 'package:navigation_test/navigator/base_arguments.dart';
import 'package:navigation_test/screens/page5/bloc.dart';
import 'package:navigation_test/screens/page5/home_bloc.dart';

class FifthPage extends StatefulWidget {
  static const routeName = '/FifthPage';
  const FifthPage({
    Key? key,
  }) : super(key: key);
  //final String title;

  static AppPage page({BaseArguments? arguments}) => AppPage(
        key: const ValueKey(routeName),
        name: routeName,
        arguments: arguments,
        builder: (context) => const FifthPage(),
      );

  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends BlocState<FifthPage, HomeBlocPage5> {
  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
                stream: bloc.dataStream,
                initialData: BlocData.init(),
                builder: (context, snapshot) {
                  final blocData = snapshot.data;
                  if (blocData is BlocData) {
                    final screenData = blocData.data;
                    if (blocData.isLoading) {
                      return const CircularProgressIndicator.adaptive();
                    } else if (screenData is HomeDataPage5) {
                      return Text(
                        screenData.counter.toString(),
                        style: const TextStyle(
                            color: Colors.pinkAccent, fontSize: 25),
                      );
                    } else {
                      return const SizedBox();
                    }
                  } else {
                    return const SizedBox();
                  }
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bloc.incrementCounter,
        backgroundColor: Colors.pinkAccent,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
