import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation_test/app/app_page.dart';
import 'package:navigation_test/navigator/app_navigator.dart';
import 'package:navigation_test/navigator/base_arguments.dart';
import 'package:navigation_test/screens/page1/page1.dart';
import 'package:navigation_test/screens/page3/page3.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);
  static const routeName = '/DetailsPage';

  static AppPage page({BaseArguments? arguments}) => AppPage(
        key: const ValueKey(routeName),
        name: routeName,
        arguments: arguments,
        builder: (context) => const SecondPage(),
      );

//   @override
//   State<SecondPage> createState() => _SecondPageState();
// }

// class _SecondPageState extends BlocState<SecondPage, HomeBloc> {

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
        onPressed: () {
          //bloc.navigateToSecond();
          GetIt.I.get<AppNavigator>().push(ThridPage.page());
        },
        tooltip: 'Increment',
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
