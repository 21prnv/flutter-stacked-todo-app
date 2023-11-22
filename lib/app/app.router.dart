// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;
import 'package:todo_app/model/todo.dart' as _i8;
import 'package:todo_app/ui/views/home/home_view.dart' as _i2;
import 'package:todo_app/ui/views/login/login_view.dart' as _i4;
import 'package:todo_app/ui/views/notes_details/notes_details_view.dart' as _i6;
import 'package:todo_app/ui/views/startup/startup_view.dart' as _i3;
import 'package:todo_app/ui/views/verifyotp/verifyotp_view.dart' as _i5;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const verifyotpView = '/verifyotp-view';

  static const notesDetailsView = '/notes-details-view';

  static const all = <String>{
    homeView,
    startupView,
    loginView,
    verifyotpView,
    notesDetailsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i4.LoginView,
    ),
    _i1.RouteDef(
      Routes.verifyotpView,
      page: _i5.VerifyotpView,
    ),
    _i1.RouteDef(
      Routes.notesDetailsView,
      page: _i6.NotesDetailsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginView(),
        settings: data,
      );
    },
    _i5.VerifyotpView: (data) {
      final args = data.getArgs<VerifyotpViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i5.VerifyotpView(key: args.key, mobileNumber: args.mobileNumber),
        settings: data,
      );
    },
    _i6.NotesDetailsView: (data) {
      final args = data.getArgs<NotesDetailsViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.NotesDetailsView(args.todo, key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class VerifyotpViewArguments {
  const VerifyotpViewArguments({
    this.key,
    required this.mobileNumber,
  });

  final _i7.Key? key;

  final String mobileNumber;

  @override
  String toString() {
    return '{"key": "$key", "mobileNumber": "$mobileNumber"}';
  }

  @override
  bool operator ==(covariant VerifyotpViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.mobileNumber == mobileNumber;
  }

  @override
  int get hashCode {
    return key.hashCode ^ mobileNumber.hashCode;
  }
}

class NotesDetailsViewArguments {
  const NotesDetailsViewArguments({
    required this.todo,
    this.key,
  });

  final _i8.Todo todo;

  final _i7.Key? key;

  @override
  String toString() {
    return '{"todo": "$todo", "key": "$key"}';
  }

  @override
  bool operator ==(covariant NotesDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.todo == todo && other.key == key;
  }

  @override
  int get hashCode {
    return todo.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i9.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyotpView({
    _i7.Key? key,
    required String mobileNumber,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.verifyotpView,
        arguments: VerifyotpViewArguments(key: key, mobileNumber: mobileNumber),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNotesDetailsView({
    required _i8.Todo todo,
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.notesDetailsView,
        arguments: NotesDetailsViewArguments(todo: todo, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyotpView({
    _i7.Key? key,
    required String mobileNumber,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.verifyotpView,
        arguments: VerifyotpViewArguments(key: key, mobileNumber: mobileNumber),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNotesDetailsView({
    required _i8.Todo todo,
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.notesDetailsView,
        arguments: NotesDetailsViewArguments(todo: todo, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
