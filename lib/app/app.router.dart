// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:kamus_kesehatan/ui/views/splash_screen/splash_screen_view.dart'
    as _i2;
import 'package:kamus_kesehatan/ui/views/user_tracking_index/list_kamus_kesehatan/list_kamus_kesehatan_view.dart'
    as _i5;
import 'package:kamus_kesehatan/ui/views/user_tracking_index/profil_user/profil_user_view.dart'
    as _i6;
import 'package:kamus_kesehatan/ui/views/user_tracking_index/user_tracking_index_view.dart'
    as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i7;

class Routes {
  static const splashScreenView = '/';

  static const userTrackingIndexView = '/user-tracking-index-view';

  static const all = <String>{
    splashScreenView,
    userTrackingIndexView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreenView,
      page: _i2.SplashScreenView,
    ),
    _i1.RouteDef(
      Routes.userTrackingIndexView,
      page: _i3.UserTrackingIndexView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreenView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreenView(),
        settings: data,
      );
    },
    _i3.UserTrackingIndexView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.UserTrackingIndexView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class UserTrackingIndexViewRoutes {
  static const listKamusKesehatanView = 'list-kamus-kesehatan-view';

  static const profilUserView = 'profil-user-view';

  static const all = <String>{
    listKamusKesehatanView,
    profilUserView,
  };
}

class UserTrackingIndexViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      UserTrackingIndexViewRoutes.listKamusKesehatanView,
      page: _i5.ListKamusKesehatanView,
    ),
    _i1.RouteDef(
      UserTrackingIndexViewRoutes.profilUserView,
      page: _i6.ProfilUserView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i5.ListKamusKesehatanView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.ListKamusKesehatanView(),
        settings: data,
      );
    },
    _i6.ProfilUserView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ProfilUserView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i7.NavigationService {
  Future<dynamic> navigateToSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserTrackingIndexView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.userTrackingIndexView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedListKamusKesehatanViewInUserTrackingIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(
        UserTrackingIndexViewRoutes.listKamusKesehatanView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedProfilUserViewInUserTrackingIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(UserTrackingIndexViewRoutes.profilUserView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserTrackingIndexView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.userTrackingIndexView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedListKamusKesehatanViewInUserTrackingIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(
        UserTrackingIndexViewRoutes.listKamusKesehatanView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedProfilUserViewInUserTrackingIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(UserTrackingIndexViewRoutes.profilUserView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
