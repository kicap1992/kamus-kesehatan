import 'package:flutter/material.dart';
import 'package:kamus_kesehatan/app/themes/app_text.dart';
import 'package:kamus_kesehatan/ui/widgets/my_textformfield.dart';
import 'package:stacked/stacked.dart';

import './list_kamus_kesehatan_view_model.dart';

class ListKamusKesehatanView extends StatelessWidget {
  const ListKamusKesehatanView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListKamusKesehatanViewModel>.reactive(
      viewModelBuilder: () => ListKamusKesehatanViewModel(),
      onViewModelReady: (ListKamusKesehatanViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        ListKamusKesehatanViewModel model,
        Widget? child,
      ) {
        return Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              MyTextFormField(
                hintText: 'Cari istilah',
                labelText: 'Cari istilah',
                controller: model.searchController,
                suffixIcon: const Icon(Icons.search),
                onChanged: (String value) {
                  model.searchIstilah();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: model.listIstilah.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: model.listIstilah.length,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          return Card(
                            child: ListTile(
                              title: Text(
                                model.listIstilah[index].istilah!.toUpperCase(),
                                style: boldTextStyle,
                              ),
                              subtitle: Text(model.listIstilah[index].arti!),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      model.cekSuara(model.listIstilah[index]);
                                    },
                                    child: const Icon(Icons.volume_up),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      model.bukaDialogAksi(
                                          model.listIstilah[index]);
                                    },
                                    icon: const Icon(Icons.info),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
