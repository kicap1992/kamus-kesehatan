import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/app.dialogs.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/istilah_model1.dart';
import '../../../../services/my_tts.dart';

class ListDetailIstilahViewModel extends CustomBaseViewModel {
  final log = getLogger('ListDetailIstilahViewModel');
  final myTts = locator<MyTts>();

  TextEditingController searchController = TextEditingController();

  List<IstilahModel1> listIstilah = [];
  List<IstilahModel1> allListIstilah = [];

  Future<void> init(String kategori) async {
    // await myTts.init();
    // myTts.getVoices();
    var data = await rootBundle.loadString('assets/dataset1.json');
    final List<dynamic> jsonData = json.decode(data);
    listIstilah = jsonData
        .map((dynamic item) =>
            IstilahModel1.fromJson(item as Map<String, dynamic>))
        .where((IstilahModel1 istilah) => istilah.kategori == kategori)
        .toList();

    allListIstilah = listIstilah;
    notifyListeners();
  }

  cekSuara(IstilahModel1 listIstilah) {
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
          .where((IstilahModel1 istilah) => istilah.istilah!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  bukaDialogAksi(IstilahModel1 listIstilah) async {
    var res = await dialogService.showCustomDialog(
      variant: DialogType.actionDialogView,
      title: 'Form Aksi',
      data: listIstilah,
      barrierDismissible: true,
    );

    if (res!.confirmed) {
      log.i('confirmed');
      // do something
    }
  }
}
