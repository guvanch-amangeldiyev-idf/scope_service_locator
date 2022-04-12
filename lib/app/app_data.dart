import 'package:navigation_test/navigator/base_page.dart';
import 'package:navigation_test/screens/page1/page1.dart';

class AppData {
  final List<BasePage> pages;

  AppData(this.pages);

  factory AppData.init() {
    final pages = List<BasePage>.from([
      MyHomePage.page(),
    ]);
    return AppData(pages);
  }
}
