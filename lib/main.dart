import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kamus_kesehatan/services/my_storage.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.dialogs.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'app/themes/app_theme.dart';

Future main() async {
  await setupAllLocator();
  await MyStorage().init();
  // await MyTts().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cek Suara Caleg',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      builder: EasyLoading.init(),
    );
  }
}

Future<void> setupAllLocator() async {
  await setupLocator();
  setupDialogUi();
  // setupBottomSheetUi();
  // setupSnackbarUi();
}
