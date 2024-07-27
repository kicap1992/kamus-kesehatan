import 'package:flutter/material.dart';
import 'package:kamus_kesehatan/app/themes/app_text.dart';
import 'package:stacked/stacked.dart';

import '../list_detail_istilah/list_detail_istilah_view.dart';
import './halaman_utama_view_model.dart';

class HalamanUtamaView extends StatelessWidget {
  const HalamanUtamaView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HalamanUtamaViewModel>.reactive(
      viewModelBuilder: () => HalamanUtamaViewModel(),
      onViewModelReady: (HalamanUtamaViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        HalamanUtamaViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var element in model.kategoriIstilah)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          model.navigationService
                              .navigateToView(ListDetailIstilahView(
                            kategori: element['kategori'],
                          ));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: element['color'],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              element['icon'],
                              const SizedBox(height: 10),
                              Text(
                                model.myFunction
                                    .capitalize(element['kategori']),
                                style: boldTextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 10),
                              if (element['kategori'] == 'anggota tubuh')
                                ForCount(
                                    count: model.anggotaTubuhCount.toString()),
                              if (element['kategori'] == 'penyakit')
                                ForCount(count: model.penyakitCount.toString()),
                              if (element['kategori'] == 'obat')
                                ForCount(count: model.obatCount.toString()),
                              if (element['kategori'] == 'alat')
                                ForCount(count: model.alatCount.toString()),
                              if (element['kategori'] == 'umum')
                                ForCount(count: model.umumCount.toString()),
                              if (element['kategori'] == 'hormon')
                                ForCount(count: model.hormonCount.toString()),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ForCount extends StatelessWidget {
  const ForCount({
    super.key,
    required this.count,
  });

  final String count;

  @override
  Widget build(BuildContext context) {
    return Text(
      count,
      style: boldTextStyle.copyWith(
        color: Colors.white,
        fontSize: 13,
      ),
    );
  }
}
