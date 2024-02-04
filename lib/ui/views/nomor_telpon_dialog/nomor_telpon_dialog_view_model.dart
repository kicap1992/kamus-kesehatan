import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/app.logger.dart';
import '../../../app/core/custom_base_view_model.dart';
import '../../../model/istilah_model.dart';

class NomorTelponDialogViewModel extends CustomBaseViewModel {
  final log = getLogger('NomorTelponDialogViewModel');
  TextEditingController nomorTelponController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  IstilahModel? data;
  Future<void> init(IstilahModel data) async {
    log.i('init');
    log.i(data.istilah.toString());
    log.i(data.arti.toString());
    this.data = data;
    // await myStorage.clear();
  }

  openWhatsapp() async {
    // open whatsapp using url
    String noTelpon = nomorTelponController.text;
    // convert the number to international format
    noTelpon = noTelpon.replaceAll(RegExp(r'[^0-9]'), '');
    noTelpon = '62${noTelpon.substring(1)}';

    log.i('no_telpon: $noTelpon');
    // add the data to url with query parameter
    final url = Uri.parse('https://wa.me/$noTelpon?text=Kamus Medis : \n'
        'Istilah : ${data!.istilah}\n'
        'Arti : ${data!.arti}');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
