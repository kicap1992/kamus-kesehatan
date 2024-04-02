import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../services/global_var.dart';

class UserTrackingIndexViewModel extends IndexTrackingViewModel {
  final log = getLogger('UserTrackingIndexViewModel');
  final globalVar = locator<GlobalVar>();
  final navigationService = locator<NavigationService>();
  final dialogService = locator<DialogService>();

  final _bottomNavBarList = [
    {
      'name': 'List Kamus',
      'icon': Icons.list_alt_outlined,
      'header': 'List Kamus',
    },
    {
      'name': 'Bookmark Kamus',
      'icon': Icons.bookmark_border_outlined,
      'header': 'Bookmark Kamus',
    },
  ];

  String header = 'List Kamus';
  List<Map<String, dynamic>> get bottomNavBarList => _bottomNavBarList;

  final List<String> _views = [
    // UserTrackingIndexViewRoutes.tampilkanListView,
    UserTrackingIndexViewRoutes.listKamusKesehatanView,
    UserTrackingIndexViewRoutes.profilUserView,
  ];

  Future<void> init() async {
    // setIndex(0);
    // handleNavigation(0);
  }

  void handleNavigation(int index) {
    // log.d("handleNavigation: $index");
    // log.d("currentIndex: $currentIndex");

    if (currentIndex == index) return;

    setIndex(index);
    header = _bottomNavBarList[index]['header'] as String;
    navigationService.navigateTo(
      _views[index],
      id: 2,
    );
  }

  exitApp() async {
    dialogService
        .showConfirmationDialog(
      title: 'Konfirmasi',
      description: 'Apakah anda yakin ingin keluar?',
      cancelTitle: 'Batal',
      confirmationTitle: 'Keluar',
    )
        .then((value) async {
      if (value!.confirmed) {
        SystemNavigator.pop();
      }
    });
  }
}
