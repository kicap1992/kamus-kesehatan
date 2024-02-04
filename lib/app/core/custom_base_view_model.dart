import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/global_var.dart';
import '../../services/my_easyloading.dart';
import '../../services/other_function.dart';
import '../app.locator.dart';

class CustomBaseViewModel extends BaseViewModel {
  final dialogService = locator<DialogService>();
  final navigationService = locator<NavigationService>();
  final bottomSheetService = locator<BottomSheetService>();
  final snackbarService = locator<SnackbarService>();
  // below is mine
  final easyLoading = locator<MyEasyLoading>();
  final globalVar = locator<GlobalVar>();
  final myFunction = locator<MyFunction>();

  void back() {
    navigationService.back();
  }
}
