import 'package:flutter/material.dart';

import 'base_arguments.dart';

abstract class BasePage<T extends BaseArguments> extends Page {
  const BasePage({
    @required required LocalKey key,
    @required required String name,
    @required required this.builder,
   
    this.showSlideAnim,
    T? arguments,
  }) : super(key: key, name: name, arguments: arguments);

  final WidgetBuilder builder;
  final bool? showSlideAnim;
  //final Widget? animeWidget; //! anime

  @override
  Route createRoute(BuildContext context) => _AppRoute(
        settings: this,
        builder: builder,
        showSlideAnim: showSlideAnim == true,
        //animeWidget: animeWidget,
      );

  @override
  String toString() => '$name';
}

const begin = Offset(0.0, 1.0);
const end = Offset.zero;
const curve = Curves.ease;

var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

class _AppRoute extends MaterialPageRoute {
  final bool showSlideAnim;
  //final Widget? animeWidget;
  _AppRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    this.showSlideAnim = false,
    //this.animeWidget,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (!showSlideAnim) {
      return //SlideTransition(position: animation.drive(tween), child: child);
          FadeTransition(
        opacity: animation,
        child: child,
      );
    }
    return Theme.of(context).pageTransitionsTheme.buildTransitions(
          this,
          context,
          animation,
          secondaryAnimation,
          child,
        );
  }
}
