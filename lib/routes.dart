import 'package:flutter/material.dart';
import 'package:gitone/repository/actions.dart';
import 'package:gitone/repository/state.dart';
import 'package:redux/redux.dart';

class Routes {
  static final home = "/";
  static final repo = "/repository";
}

class RoutingMiddleware extends MiddlewareClass<RepositoryState> {
  final GlobalKey<NavigatorState> navigatorKey;

  RoutingMiddleware(this.navigatorKey);

  @override
  void call(Store<RepositoryState> store, dynamic action, NextDispatcher next) {
    if (action is OpenRepositorySuccessAction) {
      navigatorKey.currentState.pushNamed(Routes.repo);
    }

    next(action);
  }
}
