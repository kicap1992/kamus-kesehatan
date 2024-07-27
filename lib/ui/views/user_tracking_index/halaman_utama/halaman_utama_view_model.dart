import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/istilah_model1.dart';

class HalamanUtamaViewModel extends CustomBaseViewModel {
  final log = getLogger('HalamanUtamaViewModel');
  List<IstilahModel1> listIstilah = [];
  List<Map<String, dynamic>> kategoriIstilah = [];
  int penyakitCount = 0;
  int anggotaTubuhCount = 0;
  int obatCount = 0;
  int alatCount = 0;
  int umumCount = 0;
  int hormonCount = 0;
  Future<void> init() async {
    setBusy(true);
    listIstilah = await rootBundle.loadString('assets/dataset1.json').then(
      (String data) {
        final List<dynamic> jsonData = json.decode(data);
        return jsonData.map((dynamic item) {
          return IstilahModel1.fromJson(item as Map<String, dynamic>);
        }).toList();
      },
    );

    log.i(listIstilah.length);

    for (var element in listIstilah) {
      Icon? icon;
      Color? color;
      switch (element.kategori) {
        case 'penyakit':
          icon = const Icon(Icons.health_and_safety, color: Colors.white);
          color = Colors.red;
          penyakitCount++;
          break;
        case 'anggota tubuh':
          icon = const Icon(Icons.heart_broken, color: Colors.white);
          color = Colors.red;
          anggotaTubuhCount++;
          break;
        case 'obat':
          icon = const Icon(Icons.medication_liquid, color: Colors.white);
          color = Colors.blue;
          obatCount++;
          break;
        case 'alat':
          icon = const Icon(Icons.medical_information, color: Colors.white);
          color = Colors.blue;
          alatCount++;
        case 'umum':
          icon = const Icon(Icons.medical_information, color: Colors.white);
          color = Colors.blue;
          umumCount++;
        case 'hormon':
          icon = const Icon(Icons.medical_information, color: Colors.white);
          color = Colors.blue;
          hormonCount++;
        default:
          break;
      }

      // add to kategoriIstilah and if the kategori is not in the list, add it
      if (!kategoriIstilah.any((k) => k['kategori'] == element.kategori)) {
        kategoriIstilah.add({
          'icon': icon,
          'color': color,
          'kategori': element.kategori,
        });
      }

      // add count to the kategoriIstilah
    }

    kategoriIstilah.sort((a, b) => a['kategori'].compareTo(b['kategori']));
    setBusy(false);
  }
}
