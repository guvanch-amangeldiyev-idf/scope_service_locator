import 'package:flutter/material.dart';
import 'package:navigation_test/navigator/base_arguments.dart';
import 'package:navigation_test/navigator/base_page.dart';

class AppPage extends BasePage {
  const AppPage({
    required LocalKey key,
    required String name,
    required WidgetBuilder builder,

    //! added
    bool? showSlideAnim,
    BaseArguments? arguments,
  }) : super(
          key: key,
          name: name,
          builder: builder,
          arguments: arguments,
          showSlideAnim: showSlideAnim,
        );
}
