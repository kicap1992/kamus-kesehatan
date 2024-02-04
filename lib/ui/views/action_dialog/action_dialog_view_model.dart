import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/core/custom_base_view_model.dart';
import '../../../model/istilah_model.dart';
import '../../../services/my_storage.dart';

class ActionDialogViewModel extends CustomBaseViewModel {
  final log = getLogger('ActionDialogViewModel');
  final myStorage = locator<MyStorage>();
  IstilahModel? data;

  Future<void> init(IstilahModel? data) async {
    // log.i('init');
    // log.i(data!.istilah.toString());
    // log.i(data.arti.toString());
    this.data = data;
    // await myStorage.clear();
  }

  addBookmark(IstilahModel istilahModel) async {
    List<dynamic>? listBookmark;

    listBookmark = await myStorage.read('listBookmark');

    listBookmark ??= [];

    log.i('ini panjang listBookmark ${listBookmark.length}');
    log.i('ini listBookmark $listBookmark');

    // check if istilahModel is already in listBookmark
    bool isExist = false;
    for (var item in listBookmark) {
      if (item['istilah'] == istilahModel.istilah) {
        isExist = true;
        break;
      }
    }

    if (isExist) {
      snackbarService.showSnackbar(
        message: 'Bookmark sudah ada',
        duration: const Duration(seconds: 2),
      );
      return;
    }

    listBookmark.add({
      'istilah': istilahModel.istilah,
      'arti': istilahModel.arti,
    });

    await myStorage.write('listBookmark', listBookmark);

    snackbarService.showSnackbar(
      message: 'Berhasil menambahkan bookmark',
      duration: const Duration(seconds: 2),
    );

    // // check if istilahModel is already in listBookmark
    // bool isExist = false;
    // for (var item in listBookmark) {
    //   if (item.istilah == istilahModel.istilah) {
    //     isExist = true;
    //     break;
    //   }
    // }

    // if (!isExist) {
    //   listBookmark.add(istilahModel);
    //   await myStorage.write('listBookmark', listBookmark);
    //   snackbarService.showSnackbar(
    //     message: 'Berhasil menambahkan bookmark',
    //     duration: const Duration(seconds: 2),
    //   );
    // } else {
    //   snackbarService.showSnackbar(
    //     message: 'Bookmark sudah ada',
    //     duration: const Duration(seconds: 2),
    //   );
    // }
  }

  openWhatsapp() async {
    await dialogService.showCustomDialog(
      variant: DialogType.nomorTelponDialogView,
      data: data,
    );
  }
}
