// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:kamus_kesehatan/ui/views/splash_screen/splash_screen_view.dart'
    as _i2;
import 'package:kamus_kesehatan/ui/views/user_tracking_index/halaman_utama/halaman_utama_view.dart'
    as _i6;
import 'package:kamus_kesehatan/ui/views/user_tracking_index/list_detail_istilah/list_detail_istilah_view.dart'
    as _i4;
import 'package:kamus_kesehatan/ui/views/user_tracking_index/profil_user/profil_user_view.dart'
    as _i7;
import 'package:kamus_kesehatan/ui/views/user_tracking_index/user_tracking_index_view.dart'
    as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const splashScreenView = '/';

  static const userTrackingIndexView = '/user-tracking-index-view';

  static const listDetailIstilahView = '/list-detail-istilah-view';

  static const all = <String>{
    splashScreenView,
    userTrackingIndexView,
    listDetailIstilahView,
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
    _i1.RouteDef(
      Routes.listDetailIstilahView,
      page: _i4.ListDetailIstilahView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreenView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreenView(),
        settings: data,
      );
    },
    _i3.UserTrackingIndexView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.UserTrackingIndexView(),
        settings: data,
      );
    },
    _i4.ListDetailIstilahView: (data) {
      final args = data.getArgs<ListDetailIstilahViewArguments>(nullOk: false);
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.ListDetailIstilahView(key: args.key, kategori: args.kategori),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ListDetailIstilahViewArguments {
  const ListDetailIstilahViewArguments({
    this.key,
    required this.kategori,
  });

  final _i5.Key? key;

  final String kategori;

  @override
  String toString() {
    return '{"key": "$key", "kategori": "$kategori"}';
  }

  @override
  bool operator ==(covariant ListDetailIstilahViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.kategori == kategori;
  }

  @override
  int get hashCode {
    return key.hashCode ^ kategori.hashCode;
  }
}

class UserTrackingIndexViewRoutes {
  static const halamanUtamaView = 'halaman-utama-view';

  static const profilUserView = 'profil-user-view';

  static const all = <String>{
    halamanUtamaView,
    profilUserView,
  };
}

class UserTrackingIndexViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      UserTrackingIndexViewRoutes.halamanUtamaView,
      page: _i6.HalamanUtamaView,
    ),
    _i1.RouteDef(
      UserTrackingIndexViewRoutes.profilUserView,
      page: _i7.ProfilUserView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i6.HalamanUtamaView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.HalamanUtamaView(),
        settings: data,
      );
    },
    _i7.ProfilUserView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ProfilUserView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i8.NavigationService {
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

  Future<dynamic> navigateToListDetailIstilahView({
    _i5.Key? key,
    required String kategori,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.listDetailIstilahView,
        arguments: ListDetailIstilahViewArguments(key: key, kategori: kategori),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedHalamanUtamaViewInUserTrackingIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(UserTrackingIndexViewRoutes.halamanUtamaView,
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

  Future<dynamic> replaceWithListDetailIstilahView({
    _i5.Key? key,
    required String kategori,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.listDetailIstilahView,
        arguments: ListDetailIstilahViewArguments(key: key, kategori: kategori),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedHalamanUtamaViewInUserTrackingIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(UserTrackingIndexViewRoutes.halamanUtamaView,
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
