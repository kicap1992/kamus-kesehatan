import 'package:kamus_kesehatan/model/istilah_model.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../services/my_storage.dart';
import '../../../../services/my_tts.dart';

class ProfilUserViewModel extends CustomBaseViewModel {
  final log = getLogger('ProfilUserViewModel');
  final myTts = locator<MyTts>();
  final myStorage = locator<MyStorage>();

  List<IstilahModel>? listIstilah;
  List<IstilahModel>? allListIstilah;

  Future<void> init() async {
    List<dynamic>? listBookmark;

    listBookmark = await myStorage.read('listBookmark');

    listBookmark ??= [];

    log.i('ini panjang listBookmark ${listBookmark.length}');
    log.i('ini listBookmark $listBookmark');

    listIstilah = listBookmark.map((dynamic item) {
      return IstilahModel.fromJson(item as Map<String, dynamic>);
    }).toList();

    allListIstilah = listIstilah;

    notifyListeners();
  }

  cekSuara(IstilahModel listIstilah) {
    myTts.stop();
    // speak the listIstilah.istilah and wait 2 seconds then speak the listIstilah.arti
    myTts.speak(listIstilah.istilah!);
    Future.delayed(const Duration(seconds: 2), () {
      myTts.speak(listIstilah.arti!);
    });
  }
}
