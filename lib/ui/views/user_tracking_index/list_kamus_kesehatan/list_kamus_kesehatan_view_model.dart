import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import '../../../../app/app.dialogs.dart';
import '../../../../app/app.dialogs.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/istilah_model.dart';
import '../../../../services/my_tts.dart';

class ListKamusKesehatanViewModel extends CustomBaseViewModel {
  final log = getLogger('ListKamusKesehatanViewModel');
  final myTts = locator<MyTts>();

  TextEditingController searchController = TextEditingController();

  List<IstilahModel> listIstilah = [];
  List<IstilahModel> allListIstilah = [];

  Future<void> init() async {
    // await myTts.init();
    // myTts.getVoices();
    listIstilah = await rootBundle.loadString('assets/dataset.json').then(
      (String data) {
        final List<dynamic> jsonData = json.decode(data);
        return jsonData.map((dynamic item) {
          return IstilahModel.fromJson(item as Map<String, dynamic>);
        }).toList();
      },
    );
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

  searchIstilah() {
    if (searchController.text.isEmpty) {
      listIstilah = allListIstilah;
    } else {
      listIstilah = allListIstilah
          .where((IstilahModel istilah) => istilah.istilah!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  bukaDialogAksi(IstilahModel listIstilah) async {
    var res = await dialogService.showCustomDialog(
      variant: DialogType.actionDialogView,
      title: 'Form Aksi',
      data: listIstilah,
    );

    if (res!.confirmed) {
      log.i('confirmed');
      // do something
    }
  }
}
