import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';

import '../services/global_var.dart';
import '../services/my_easyloading.dart';
import '../services/my_storage.dart';
import '../services/my_tts.dart';
import '../services/other_function.dart';
import '../ui/views/action_dialog/action_dialog_view.dart';
import '../ui/views/nomor_telpon_dialog/nomor_telpon_dialog_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';
import '../ui/views/user_tracking_index/list_kamus_kesehatan/list_kamus_kesehatan_view.dart';
import '../ui/views/user_tracking_index/profil_user/profil_user_view.dart';
import '../ui/views/user_tracking_index/user_tracking_index_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(
      page: UserTrackingIndexView,
      children: [
        MaterialRoute(page: ListKamusKesehatanView),
        // MaterialRoute(page: TampilkanListView),
        MaterialRoute(page: ProfilUserView),
      ],
    ),
  ],
  dialogs: [
    StackedDialog(classType: ActionDialogView),
    StackedDialog(classType: NomorTelponDialogView)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    // this below is mine
    LazySingleton(classType: MyEasyLoading),
    // LazySingleton(classType: MyHttpServices),
    LazySingleton(classType: GlobalVar),
    LazySingleton(classType: MyFunction),
    // LazySingleton(classType: MySharedPrefs)
    LazySingleton(classType: MyTts),
    LazySingleton(classType: MyStorage),
  ],
  logger: StackedLogger(),
  // bottomsheets: [
  //   StackedBottomsheet(classType: DetailSuaraBottomSheetView),
  //   StackedBottomsheet(classType: DetailSuaraPemilihBottomSheetView)
  // ],
)
class App {}
